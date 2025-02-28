# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libayatana-common"
pkgver="0.9.11"
pkgrel="1"
pkgdesc="Ayatana System Indicators' common API functions"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/libayatana-common"
license=("GPL-3.0-or-later")
makedepends=("cmake" "cmake-extras" "vala" "gobject-introspection" "intltool")
depends=("dconf" "zenity" "glibc" "glib2")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
md5sums=("178c01dc39cb3ac8c7bf7fbe4dc7eabd")

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
