# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="matekbd-keyboard-display"
pkgver="23.9.1"
pkgrel="1"
pkgdesc="Preview keyboard layouts on MATE desktop"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/matekbd-keyboard-display"
license=("LGPL2.1")
depends=("libxklavier" "hicolor-icon-theme" "gtk3" "libmatekbd" "glib2" "glibc")
makedepends=("at-spi2-core")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("6c30ac572fbd5b4e4ec6ca90e014a411")

build()
{
    cd ${pkgname}-${pkgver}
    cmake -S . -B build
    cmake --build build
}

package()
{
    cd ${pkgname}-${pkgver}
    DESTDIR="${pkgdir}" cmake --install build
}

