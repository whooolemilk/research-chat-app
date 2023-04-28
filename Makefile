SHELL=/bin/bash

env := $(shell docker compose exec node echo "up" || echo "down")

init:
	@docker compose build

up:
	@docker compose up

down:
	@docker compose down

exec:
	@docker compose exec node sh

yarn-install:
	@docker compose exec node yarn install
	@docker compose exec node echo "copy node_modules files from container"
	docker cp chat-app:/home/app/node_modules/ ./front/

cp:
	docker cp chat-app:/home/app/node_modules/ ./front/
