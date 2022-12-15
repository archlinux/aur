# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-display"
pkgver="22.9.2"
pkgrel="1"
pkgdesc="Ayatana Indicator Display"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-printers"
license=("GPL3")
depends=("xsct" "libayatana-common")
makedepends=("intltool" "cmake-extras" "glib2" "systemd" "hicolor-icon-theme")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("e30954504b5e1debb608da692c6479eb")

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
