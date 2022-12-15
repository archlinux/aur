# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-printers"
pkgver="22.2.0"
pkgrel="1"
pkgdesc="Ayatana Indicator showing active print jobs"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("cups" "libayatana-common")
makedepends=("intltool" "cmake-extras" "glib2" "libcups" "systemd")
optdepends=("system-config-printer")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("e188745e4ed863077ad74c9249262703")

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
