FROM node:17-alpine3.14

WORKDIR /app
COPY . /app

RUN yarn global add firebase-tools \
    && apk update \
    && apk add git 

RUN chmod +x /app/entrypoint.sh

RUN git config --global --add safe.directory "$GITHUB_WORKSPACE"

ENTRYPOINT [ "/app/entrypoint.sh" ]

