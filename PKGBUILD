# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="lampswitch"
pkgver="24.8.1"
pkgrel=1
pkgdesc="Indicator and control applet for Web services"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/lampswitch"
license=("GPL-3.0-or-later")
depends=("gtk3" "libayatana-appindicator" "hicolor-icon-theme" "glib2" "bash" "glibc")
makedepends=("cmake" "cmake-extras" "intltool")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("a066c04755d8eabf347c9299bf9e5cfd")

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
