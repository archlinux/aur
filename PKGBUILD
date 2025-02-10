# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langsmith
pkgname="python-${_pkgname}"
pkgver=0.3.8
pkgrel=1
pkgdesc="Client library to connect to the LangSmith LLM Tracing and Evaluation Platform."
arch=('any')
url="https://smith.langchain.com/"
license=('MIT')
depends=(python-httpx python-orjson python-pydantic python-requests python-requests-toolbelt python-zstandard)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-langsmith-pyo3 python-pytest python-rich python-vcrpy)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('97f9bebe0b7cb0a4f278e6ff30ae7d5ededff3883b014442ec6d7d575b02a0f1')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
