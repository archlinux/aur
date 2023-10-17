# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio-sacd"
pkgver="23.1.31"
pkgrel="1"
pkgdesc="SACD decoder"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/odio-sacd"
license=("GPL3")
makedepends=("cmake")
depends=("libodiosacd" "glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("c2de03896f48fb8ea7abd109b8a66c0c")

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
