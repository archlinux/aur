# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-power"
pkgver="2.2.0"
pkgrel="1"
pkgdesc="Ayatana Indicator showing power state"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-power"
license=("GPL3")
makedepends=("cmake-extras" "gettext")
depends=("glib2" "systemd" "libayatana-common>=0.9.5" "libnotify")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("11216ed2bef7429f6d82fca664b5a545")

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
