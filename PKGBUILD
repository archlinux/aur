# Maintainer: Relish0171 <aur.such581@aleeas.com>
# Contributor: AI5C <ai5c@ai5c.com>
# Contributor: Swift Geek
_basename=Seamly2D
pkgname=${_basename,,}
pkgver=2025.12.1.213
pkgrel=1
pkgdesc="Open source patternmaking software to democratize fashion."
arch=('i686' 'x86_64')
url="https://seamly.io/"
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'qt6-5compat')
makedepends=('qt6-tools' 'xerces-c')
source=("https://github.com/FashionFreedom/Seamly2D/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6fc8c5b366aeb71116ad2301932a0da8fed982f253bc869c1e550aba4d30f6f0')

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
