# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-power"
pkgver="22.9.4"
pkgrel="1"
pkgdesc="Ayatana Indicator showing power state"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-power"
license=("GPL3")
makedepends=("cmake-extras" "gettext")
depends=("glib2" "systemd" "libayatana-common>=0.9.5" "libnotify")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("a5204cba16e480baba878e2430fba433")

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
