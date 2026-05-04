# Maintainer: Rongbo <wurongbo2012@hotmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langsmith
pkgname="python-${_pkgname}"
pkgver=0.8.0
pkgrel=1
pkgdesc="Client library to connect to the LangSmith LLM Tracing and Evaluation Platform."
arch=('any')
url="https://github.com/langchain-ai/langsmith-sdk"
license=('MIT')
depends=(python-httpx
python-orjson
python-packaging
python-pydantic
python-requests
python-requests-toolbelt
python-xxhash
python-zstandard
python-uuid-utils
)
makedepends=('python-build'
'python-hatchling'
'python-installer')
optdepends=(python-langsmith-pyo3 python-openai-agents python-opentelemetry-api python-opentelemetry-exporter-otlp-proto-http python-opentelemetry-sdk python-pytest python-rich python-vcrpy)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('59fe5b2a56bbbe14a08aa76691f84b49e8675dd21e11b57d80c6db8c08bac2e3')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
