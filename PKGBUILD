# Maintainer: Relish0171 <aur.such581@aleeas.com>
# Contributor: AI5C <ai5c@ai5c.com>
# Contributor: Swift Geek
_basename=Seamly2D
pkgname=${_basename,,}
pkgver=2026.3.30.214
pkgrel=1
pkgdesc="Open source patternmaking software to democratize fashion."
arch=('i686' 'x86_64')
url="https://seamly.io/"
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'qt6-5compat')
makedepends=('qt6-tools' 'xerces-c')
source=("https://github.com/FashionFreedom/Seamly2D/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff33928e0731a547bf6424c688cc8178bea372d2e9080619f689226765e8bf5d')

build() {
    cd "${srcdir}/${_basename}-${pkgver}"

    qmake6 \
        PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${_basename}-${pkgver}"

    export INSTALL_ROOT="${pkgdir}"

    make install
}
