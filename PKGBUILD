# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-text-splitters
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.1.2
pkgrel=1
pkgdesc="LangChain text splitting utilities"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/text-splitters"
license=('MIT')
depends=(python-langchain-core)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('782a723db0a4746ac91e251c7c1d57fd23636e4f38ed733074e28d7a86f41627')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
