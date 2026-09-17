# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name3=slim
_name2=remote
_name1=tasks
_name0=fastmcp
pkgbase=python-$_name0
pkgname=(python-$_name0-$_name3 python-$_name0-$_name2 python-$_name0-$_name1 python-$_name0)
pkgver=4.0.5
pkgrel=1
arch=('any')
_repo='https://github.com/PrefectHQ/fastmcp'
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling'
             'python-uv-dynamic-versioning'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
# checkdepends=('python-dirty-equals'
#               'python-exceptiongroup'
#               'python-httpx2'
#               'python-mcp'
#               'python-opentelemetry-api'
#               'python-starlette'
#               'python-authlib'
#               'python-cyclopts'
#               'python-griffelib'
#               'python-jsonref'
#               'python-jsonschema-path'
#               'python-joserfc'
#               'python-openapi-pydantic'
#               'python-packaging'
#               'python-py-key-value-aio'
#               'python-aiofile'
#               'python-anyio'
#               'python-keyring'
#               'python-cachetools'
#               'python-pyperclip'
#               'python-python-multipart'
#               'python-pyyaml'
#               'python-uncalled-for'
#               'uvicorn'
#               'python-watchfiles'
#               'python-websockets'
#               'python-anthropic'
#               'python-prefab-ui'
#               'python-azure-identity'
#               'python-pyjwt'
#               'python-pydantic-monty'
#               'python-google-genai'
#               'python-jsonref'    
#               'python-openai'
#               'python-cryptography'
#               'python-pydocket')
source=("$_name0::git+$_repo.git#tag=v$pkgver")
sha256sums=('56462ad6249dc6640473a358e7f6f4f54b83e8e50489b157f0b33ba40d311a1f')

build() {
  cd "$srcdir"/$_name0
  python -m build --wheel --no-isolation ${_name0}_$_name3
  python -m build --wheel --no-isolation ${_name0}_$_name2
  python -m build --wheel --no-isolation ${_name0}_$_name1
  python -m build --wheel --no-isolation
}

# check() {
#   local pytest_options=(
#     -vv
#     --disable-warnings
#   )
#   cd "$srcdir"/$_name0
# }

package_python-fastmcp-slim() {
  pkgdesc='The dependency-slim FastMCP package.'
  depends+=('python-mcp-types'
            'python-platformdirs'
            'python-pydantic'
            'python-email-validator'
            'python-pydantic-settings'
            'python-dotenv' 'python-rich'
            'python-typing_extensions')
  optdepends=('python-anthropic: anthropic'
  
              'python-prefab-ui: apps'
              
              'python-azure-identity: azure'
              'python-pyjwt: azure'
              
              'python-exceptiongroup: client'
              'python-httpx2: client'
              'python-mcp: client'
              'python-opentelemetry-api: client'
              'python-starlette: client'
              'python-authlib: client'
              'python-py-key-value-aio: client'
              'python-aiofile: client'
              'python-anyio: client'
              'python-keyring: client'
              'python-cachetools: client'
              
              'python-pydantic-monty: code-mode'
              
              'python-google-genai: gemini'
              'python-jsonref: gemini'
              
              'python-exceptiongroup: mcp'
              'python-httpx2: mcp'
              'python-mcp: mcp'
              'python-opentelemetry-api: mcp'
              'python-starlette: mcp'
              
              'python-openai: openai'
              
              'python-exceptiongroup: server'
              'python-httpx2: server'
              'python-mcp: server'
              'python-opentelemetry-api: server'
              'python-starlette: server'
              'python-authlib: server'
              'python-cyclopts: server'
              'python-griffelib: server'
              'python-jsonref: server'
              'python-jsonschema-path: server'
              'python-joserfc: server'
              'python-openapi-pydantic: server'
              'python-packaging: server'
              'python-py-key-value-aio: server'
              'python-aiofile: server'
              'python-anyio: server'
              'python-keyring: server'
              'python-cachetools: server'
              'python-pyperclip: server'
              'python-python-multipart: server'
              'python-pyyaml: server'
              'python-uncalled-for: server'
              'uvicorn: server'
              'python-watchfiles: server'
              'python-websockets: server')
  url="$_repo/tree/main/${_name0}_$_name3"
  cd "$srcdir"/$_name0
  python -m installer --destdir="$pkgdir" ${_name0}_$_name3/dist/*.whl
}

package_python-fastmcp-remote() {
  pkgdesc='A Python stdio bridge for remote MCP servers, powered by FastMCP.'
  depends+=('python-fastmcp-slim'
            'python-exceptiongroup'
            'python-httpx2'
            'python-mcp'
            'python-opentelemetry-api'
            'python-starlette'
            'python-authlib'
            'python-cyclopts'
            'python-griffelib'
            'python-jsonref'
            'python-jsonschema-path'
            'python-joserfc'
            'python-openapi-pydantic'
            'python-packaging'
            'python-py-key-value-aio'
            'python-aiofile'
            'python-anyio'
            'python-keyring'
            'python-cachetools'
            'python-pyperclip'
            'python-python-multipart'
            'python-pyyaml'
            'python-uncalled-for'
            'uvicorn'
            'python-watchfiles'
            'python-websockets') 
  url="$_repo/tree/main/${_name0}_$_name2"
  cd "$srcdir"/$_name0
  python -m installer --destdir="$pkgdir" ${_name0}_$_name2/dist/*.whl
}

package_python-fastmcp-tasks() {
  pkgdesc='Background task execution for FastMCP servers via the io.modelcontextprotocol/tasks extension (SEP-2663).'
  depends+=('python-fastmcp-slim'
            'python-exceptiongroup'
            'python-httpx2'
            'python-mcp'
            'python-opentelemetry-api'
            'python-starlette'
            'python-authlib'
            'python-cyclopts'
            'python-griffelib'
            'python-jsonref'
            'python-jsonschema-path'
            'python-joserfc'
            'python-openapi-pydantic'
            'python-packaging'
            'python-py-key-value-aio'
            'python-aiofile'
            'python-anyio'
            'python-keyring'
            'python-cachetools'
            'python-pyperclip'
            'python-python-multipart'
            'python-pyyaml'
            'python-uncalled-for'
            'uvicorn'
            'python-watchfiles'
            'python-websockets'
            'python-cryptography'
            'python-pydocket')
  url="$_repo/tree/main/${_name0}_$_name1"
  cd "$srcdir"/$_name0
  python -m installer --destdir="$pkgdir" ${_name0}_$_name1/dist/*.whl
}

package_python-fastmcp() {
  pkgdesc='The fast, Pythonic way to build MCP servers and clients.'
  depends+=('python-fastmcp-slim'
            'python-exceptiongroup'
            'python-httpx2'
            'python-mcp'
            'python-opentelemetry-api'
            'python-starlette'
            'python-authlib'
            'python-cyclopts'
            'python-griffelib'
            'python-jsonref'
            'python-jsonschema-path'
            'python-joserfc'
            'python-openapi-pydantic'
            'python-packaging'
            'python-py-key-value-aio'
            'python-aiofile'
            'python-anyio'
            'python-keyring'
            'python-cachetools'
            'python-pyperclip'
            'python-python-multipart'
            'python-pyyaml'
            'python-uncalled-for'
            'uvicorn'
            'python-watchfiles'
            'python-websockets')
  optdepends=('python-anthropic: anthropic'
  
              'python-prefab-ui: apps'
              
              'python-azure-identity: azure'
              'python-pyjwt: azure'
              
              'python-pydantic-monty: code-mode'
              
              'python-google-genai: gemini'
              'python-jsonref: gemini'
              
              'python-openai: openai'
              
              'python-fastmcp-tasks: tasks')
  url="$_repo"
  cd "$srcdir"/$_name0
  python -m installer --destdir="$pkgdir" dist/*.whl
}
