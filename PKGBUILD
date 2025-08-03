# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langsmith
pkgname="python-${_pkgname}"
pkgver=0.4.10
pkgrel=1
pkgdesc="Client library to connect to the LangSmith LLM Tracing and Evaluation Platform."
arch=('any')
url="https://smith.langchain.com/"
license=('MIT')
depends=(python-httpx python-orjson python-packaging python-pydantic python-requests python-requests-toolbelt python-zstandard)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-langsmith-pyo3 python-openai-agents python-opentelemetry-api python-opentelemetry-exporter-otlp-proto-http python-opentelemetry-sdk python-pytest python-rich python-vcrpy)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('815531afb82fbf23592bc142dbd4d368e4ef6546b870f49ef58101a22a47bb3ed2ba054f438c8f58c4a46a230efedf423754759d0e9dfe1b9f818b226e70f167')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
