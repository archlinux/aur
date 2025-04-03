# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langsmith
pkgname="python-${_pkgname}"
pkgver=0.3.24
pkgrel=1
pkgdesc="Client library to connect to the LangSmith LLM Tracing and Evaluation Platform."
arch=('any')
url="https://smith.langchain.com/"
license=('MIT')
depends=(python-httpx python-orjson python-packaging python-pydantic python-requests python-requests-toolbelt python-zstandard)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-langsmith-pyo3 python-openai-agents python-opentelemetry-api python-opentelemetry-exporter-otlp-proto-http python-opentelemetry-sdk python-pytest python-rich python-vcrpy)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ee353dae8e59ec91eee8d3b601bc48e9d0e96722d1af14269b314ecb71e22088')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
