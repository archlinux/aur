# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-ido"
pkgver="0.9.1"
pkgrel="1"
pkgdesc="Ayatana Indicator Display Objects"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-ido"
license=("LGPL2.1" "LGPL3")
makedepends=("cmake-extras" "gobject-introspection" "vala")
depends=("glibc" "gtk3" "glib2")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
md5sums=("4c97445871517e78657d78bdb7119d00")

build()
{
    cd ${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake ..
    make
}

package()
{
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
