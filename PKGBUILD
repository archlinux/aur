# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=chromadb
pkgname="python-${_pkgname}"
pkgver=1.2.0
pkgrel=1
pkgdesc="the AI-native open-source embedding database"
arch=("any")
url="https://github.com/chroma-core/chroma"
license=('Apache-2.0')
depends=(python-bcrypt python-build python-chroma-hnswlib python-fastapi python-grpcio python-httpx python-importlib_resources python-jsonschema python-kubernetes python-mmh3 python-numpy python-onnxruntime python-opentelemetry-api python-opentelemetry-exporter-otlp-proto-grpc python-opentelemetry-instrumentation-fastapi python-opentelemetry-sdk python-orjson python-overrides python-posthog python-pybase64 python-pydantic python-pypika python-pyyaml python-rich python-tenacity python-tokenizers python-tqdm python-typer python-typing_extensions uvicorn)
makedepends=('python-build' 'python-installer' 'python-maturin' 'python-setuptools' 'python-setuptools-scm')
options=(!lto)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('e0c0e6cf026ed06389cacf185b69afab16e747d16a00dcafe00ce14772ad1e116bee03b52490499342aba3951ec0f9ba158360078b948047c66db636d4aedca0')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
