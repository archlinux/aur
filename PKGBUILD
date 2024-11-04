# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-text-splitters
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.2
pkgrel=1
pkgdesc="LangChain text splitting utilities"
arch=('any')
url="https://github.com/langchain-ai/langchain"
license=('MIT')
depends=(python-langchain-core)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('81e6515d9901d6dd8e35fb31ccd4f30f76d44b771890c789dc835ef9f16204df')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
