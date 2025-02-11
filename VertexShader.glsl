#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoords;
layout (location = 2) in vec3 aNormal;

out vec2 TexCoords;
out vec3 Normal;
out vec3 FragPos;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection; 

void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0f);
	TexCoords = aTexCoords;
	Normal = mat3(transpose(inverse(model))) * aNormal; // normal matrix to avoid mistake if you want do on-uniform scale. | inverse cost a lot
	FragPos = vec3(model * vec4(aPos, 1.0));

}