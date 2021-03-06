CC = gcc
CFLAGS = -O2 -I./include -Wall -Werror
LDFLAGS = -lallegro -lallegro_main -lallegro_primitives

CFILES = $(shell find src/ -name "*.c")
OBJS = $(CFILES:.c=.o)

litenes: $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o litenes

-include $(patsubst %.o, %.d, $(OBJS))

.PHONY: clean

clean:
	rm -f litenes $(OBJS) $(OBJS:.o=.d)
