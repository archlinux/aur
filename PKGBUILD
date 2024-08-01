# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio-sacd"
pkgver="24.8.1"
pkgrel="1"
pkgdesc="SACD decoder"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/odio-sacd"
license=("GPL-3.0-or-later")
makedepends=("cmake")
depends=("libodiosacd" "glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("f5b9c2f5dc0c920f3ad6935c3ae2a0f9")

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
