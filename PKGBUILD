# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=chromadb
pkgname="python-${_pkgname}"
pkgver=1.0.21
pkgrel=1
pkgdesc="the AI-native open-source embedding database"
arch=("any")
url="https://github.com/chroma-core/chroma"
license=('Apache-2.0')
depends=(python-bcrypt python-build python-chroma-hnswlib python-fastapi python-grpcio python-httpx python-importlib_resources python-jsonschema python-kubernetes python-mmh3 python-numpy python-onnxruntime python-opentelemetry-api python-opentelemetry-exporter-otlp-proto-grpc python-opentelemetry-instrumentation-fastapi python-opentelemetry-sdk python-orjson python-overrides python-posthog python-pybase64 python-pydantic python-pypika python-pyyaml python-rich python-tenacity python-tokenizers python-tqdm python-typer python-typing_extensions uvicorn)
makedepends=('python-build' 'python-installer' 'python-maturin' 'python-setuptools' 'python-setuptools-scm')
options=(!lto)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('04a93d2054a7c1d5284c6892f8846eb51d4384961ad0350bd3d6aa3df1995b4c8d1d6410aa84a7000cd5e4e45c855d41588eaae85f28569908d1ff39934ae7b8')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
