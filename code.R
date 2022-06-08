
set.seed(1112)
observed <- sample(1:4, 15, replace=T) %>% cbind(obs=.) %>% as_tibble()

tab <- observed %>% 
  mutate(obs= map_chr(obs,  ~paste0("t",.x)),
         Int1= case_when(obs=="t4"  ~ "t3",
                         T ~ obs),
         Int2= case_when(obs %in% c("t4","t3")  ~ "t2",
                         T ~ obs),
         Int3= case_when(obs %in% c("t4","t3", "t2")  ~ "t1",
                         T ~ obs),
         Int4= case_when(obs %in% c("t1")  ~ "t2",
                         T ~ obs),
         Int5= case_when(obs %in% c("t1","t2")  ~ "t3",
                         T ~ obs)
         )
saveRDS(tab,"tabls.rds")


t1 <- tab %>% select(obs, Int1)
t2 <- tab %>% select(obs, Int2)
t3 <- tab %>% select(obs, Int3)
t4 <- tab %>% select(obs, Int4)
t5 <- tab %>% select(obs, Int5)


knitr::kable(list(t1, t2,t3,t4,t5))