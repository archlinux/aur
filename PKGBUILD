# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-text-splitters
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.10
pkgrel=1
pkgdesc="LangChain text splitting utilities"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/text-splitters"
license=('MIT')
depends=(python-langchain-core)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('b00a82b92eb362a9842f7d7a16d6d223fc93a9be4c51c14109be7d15d120c67f')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
