# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="caja-rename"
pkgver="24.2.1"
pkgrel=1
pkgdesc="Batch renaming extension for Caja"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/caja-rename"
license=("GPL3")
makedepends=("cmake" "cmake-extras" "intltool")
depends=("caja" "gtk3" "hicolor-icon-theme" "glib2" "glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("4bba6fb03b99a9b4e40a86501d4bd364")

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
