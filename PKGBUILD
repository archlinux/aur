# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="lampswitch"
pkgver="24.9.1"
pkgrel=1
pkgdesc="Indicator and control applet for Web services"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/lampswitch"
license=("GPL-3.0-or-later")
depends=("gtk3" "libayatana-appindicator" "hicolor-icon-theme" "glib2" "bash" "glibc")
makedepends=("cmake" "cmake-extras" "intltool")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("054ec3a0e80a54f1f9014949dddc9b9c")

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
