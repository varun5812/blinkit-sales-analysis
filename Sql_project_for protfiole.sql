select * 
from mytable;



UPDATE mytable
SET Item_Fat_Content = 
    CASE 
        WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
        WHEN Item_Fat_Content = 'reg' THEN 'Regular'
        ELSE Item_Fat_Content
    END;

SELECT CAST(SUM(Total_Sales) / 1000000.0 AS DECIMAL(10,2)) AS Total_Sales_Million
FROM mytable;


SELECT  CAST(AVG(Total_Sales) AS decimal) AS Avg_Sales
FROM mytable;

SELECT COUNT(*) AS No_of_Orders
FROM mytable;


SELECT CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM mytable;

SELECT Item_Fat_Content, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS sum_Total_Sales,
CAST(avg(Total_Sales) AS DECIMAL(10,2)) AS avg_Total_Sales,
CAST(count(Total_Sales) AS DECIMAL(10,2)) AS count_Total_Sales
FROM mytable
GROUP BY Item_Fat_Content;

SELECT  Item_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(avg(Total_Sales) AS DECIMAL(10,2)) AS avg_Total_Sales,
CAST(count(Total_Sales) AS DECIMAL(10,2)) AS count_Total_Sales
FROM mytable
GROUP BY Item_Type
ORDER BY Total_Sales DESC;


SELECT  Item_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(avg(Total_Sales) AS DECIMAL(10,2)) AS avg_Total_Sales,
CAST(count(Total_Sales) AS DECIMAL(10,2)) AS count_Total_Sales
FROM mytable
where Outlet_Establishment_Year2 = 2022
GROUP BY Item_Type
ORDER BY Total_Sales DESC;


select Outlet_LocationType, Item_Fat_Content,CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(avg(Total_Sales) AS DECIMAL(10,2)) AS avg_Total_Sales,
CAST(count(Total_Sales) AS DECIMAL(10,2)) AS count_Total_Sales,Item_Fat_Content
from mytable
group by Outlet_LocationType,Item_Fat_Content
order by Outlet_LocationType desc
;


SELECT Outlet_Location_Type, 
       ISNULL(Low Fat, 0) AS Low_Fat, 
       ISNULL(Regular, 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM mytable
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;


SELECT Outlet_Establishment_Year2, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS sum_Total_Sales,
CAST(avg(Total_Sales) AS DECIMAL(10,2)) AS avg_Total_Sales,
CAST(count(Total_Sales) AS DECIMAL(10,2)) AS count_Total_Sales
FROM mytable
GROUP BY Outlet_Establishment_Year2
order by Outlet_Establishment_Year2 ASc;


select Outlet_Size,CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS sum_Total_Sales,
cast((sum(Total_Sales) * 100.0 /sum(sum(Total_Sales)) over()) AS DECIMAL(10 ,2)) AS per_Total_Sales
FROM mytable
GROUP BY Outlet_Size;



SELECT Outlet_LocationType, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS sum_Total_Sales,
CAST(avg(Total_Sales) AS DECIMAL(10,2)) AS avg_Total_Sales,
cast((sum(Total_Sales) * 100.0 /sum(sum(Total_Sales)) over()) AS DECIMAL(10 ,2)) AS per_Total_Sales,
CAST(count(Total_Sales) AS DECIMAL(10,2)) AS count_Total_Sales
FROM mytable
GROUP BY Outlet_LocationType
order by Outlet_LocationType ASc;

SELECT Outlet_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS sum_Total_Sales,
CAST(avg(Total_Sales) AS DECIMAL(10,2)) AS avg_Total_Sales,
cast((sum(Total_Sales) * 100.0 /sum(sum(Total_Sales)) over()) AS DECIMAL(10 ,2)) AS per_Total_Sales,
CAST(count(Total_Sales) AS DECIMAL(10,2)) AS count_Total_Sales
FROM mytable
GROUP BY Outlet_Type
order by Outlet_Type ASc;





