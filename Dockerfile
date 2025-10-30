FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY tsconfig.json ./

# Copy source code
COPY src ./src

# Install dependencies and build
RUN npm ci
RUN npm run build

# Expose port (check what port the MCP server uses)
EXPOSE 8080

# Start the server
CMD ["node", "dist/index.js"]
