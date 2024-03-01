# Use a base image with Node.js 19.7.0 on Alpine Linux
FROM node:19.7.0-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build and prettify the application (if needed)
RUN npm run prettify

# Expose the port on which your application will run
EXPOSE 3000

# Command to start the application
CMD ["npm", "run", "dev"]

