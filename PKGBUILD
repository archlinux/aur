# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-api
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc=""
arch=('any')
url="https://pypi.org/project/langgraph-api/"
license=('Elastic-2.0')
depends=('python' 'python-sse-starlette' 'python-starlette' 'python-watchfiles' 'python-langgraph' 'python-langgraph-checkpoint' 'python-orjson' 'uvicorn' 'python-langsmith' 'python-opentelemetry-sdk' 'python-opentelemetry-api' 'python-opentelemetry-exporter-otlp-proto-http' 'python-httpx' 'python-langchain-core' 'python-tenacity' 'python-jsonschema-rs' 'python-structlog' 'python-pyjwt' 'python-cryptography' 'python-langgraph-sdk' 'python-cloudpickle' 'python-langgraph-runtime-inmem' 'python-truststore' 'python-protobuf' 'python-grpcio' 'python-grpcio-tools' 'python-grpcio-health-checking' 'python-uuid-utils')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('8c70402f403d8a819dcc2e695c2bb5aa832ce2d6bfb222e3f86cd1fbd305aa0a')

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
