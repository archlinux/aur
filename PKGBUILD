# Maintainer: Relish0171 <aur.such581@aleeas.com>
# Contributor: AI5C <ai5c@ai5c.com>
# Contributor: Swift Geek
_basename=Seamly2D
pkgname=${_basename,,}
pkgver=2026.10.5.154
pkgrel=1
pkgdesc="Open source patternmaking software to democratize fashion."
arch=('i686' 'x86_64')
url="https://seamly.io/"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'qt6-base' 'qt6-multimedia' 'qt6-svg' 'xerces-c')
makedepends=('qt6-tools')
source=("${_basename}-${pkgver}.tar.gz::https://github.com/FashionFreedom/Seamly2D/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07b8dffe90a31e678492bd454010dde15b6ae3a44c4366f922469cba3a391148')

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
