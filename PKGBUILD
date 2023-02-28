# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-power"
pkgver="22.9.5"
pkgrel="1"
pkgdesc="Ayatana Indicator showing power state"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-power"
license=("GPL3")
makedepends=("cmake-extras" "gettext")
depends=("glib2" "systemd" "libayatana-common>=0.9.5" "libnotify")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("09de260a48d3c44c413d0f2aec2a2e46")

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
