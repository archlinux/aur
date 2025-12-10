# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-api
pkgname=python-$_name
pkgver=0.5.37
pkgrel=1
pkgdesc=""
arch=('any')
url="https://pypi.org/project/langgraph-api/"
license=('Elastic-2.0')
depends=('python' 'python-sse-starlette' 'python-starlette' 'python-watchfiles' 'python-langgraph' 'python-langgraph-checkpoint' 'python-orjson' 'uvicorn' 'python-langsmith' 'python-httpx' 'python-langchain-core' 'python-tenacity' 'python-jsonschema-rs' 'python-structlog' 'python-pyjwt' 'python-cryptography' 'python-langgraph-sdk' 'python-cloudpickle' 'python-langgraph-runtime-inmem' 'python-truststore' 'python-protobuf' 'python-grpcio' 'python-grpcio-tools' 'python-opentelemetry-api' 'python-opentelemetry-sdk' 'python-opentelemetry-exporter-otlp-proto-http' 'python-uuid-utils')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('1abbbcf78e2cbd5868b774d02ee60f4e32f4d0506e166841f52a7eebd2b66e28')

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
