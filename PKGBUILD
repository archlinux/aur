# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-api
pkgname=python-${_name}
pkgver=0.2.78
pkgrel=1
pkgdesc=""
arch=('any')
url="https://pypi.org/project/langgraph-api/"
license=('Elastic-2.0')
depends=('python' 'python-sse-starlette' 'python-starlette' 'python-watchfiles' 'python-langgraph' 'python-langgraph-checkpoint' 'python-orjson' 'uvicorn' 'python-langsmith' 'python-httpx' 'python-langchain-core' 'python-tenacity' 'python-jsonschema-rs' 'python-structlog' 'python-pyjwt' 'python-cryptography' 'python-langgraph-sdk' 'python-cloudpickle' 'python-langgraph-runtime-inmem' 'python-truststore')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('37aad4fe764934f358dbb26d50b4acbf4180aac673499d1502b5b468cc7acba4')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
