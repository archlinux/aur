# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="caja-rename"
pkgver="24.10.1"
pkgrel=1
pkgdesc="Batch renaming extension for Caja"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/caja-rename"
license=("GPL-3.0-or-later")
makedepends=("cmake" "cmake-extras" "intltool")
depends=("caja" "gtk3" "hicolor-icon-theme" "glib2" "glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("12492180ae9122da36af2a0100bbcfef")

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
