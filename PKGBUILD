# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-application"
pkgver="0.8.91"
pkgrel="1"
pkgdesc="Ayatana Application Indicators"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-application"
license=("GPL3")
depends=("libayatana-appindicator" "dbus-glib")
makedepends=("cmake-extras" "glib2" "libayatana-indicator>=0.9.0" "gtk3" "libdbusmenu-gtk3" "systemd" "intltool")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("a52ad9d5d047f27f015102d89a6791e5")
options=("!emptydirs")

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
