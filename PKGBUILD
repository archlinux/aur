# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-settings"
pkgver="24.10.1"
pkgrel=1
pkgdesc="Configuration tool for tweaking all Ayatana system indicators"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-settings"
license=("GPL-3.0-or-later")
depends=("gtk4" "glib2" "glibc" "hicolor-icon-theme")
makedepends=("cmake-extras" "intltool")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("510b3de6694a456825aeb039c9fc7968")

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

