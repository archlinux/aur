# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-settings"
pkgver="23.11.14"
pkgrel=1
pkgdesc="Configuration tool for tweaking all Ayatana system indicators"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-settings"
license=("GPL-3.0-or-later")
depends=("gtk4" "glib2" "glibc" "hicolor-icon-theme")
makedepends=("cmake-extras" "intltool")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("234caec1854c6ece424f1ef61f46178b")

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

