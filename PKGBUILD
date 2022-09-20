# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-application"
pkgver="22.2.0"
pkgrel="1"
pkgdesc="Ayatana Application Indicators"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-application"
license=("GPL3")
depends=("libayatana-appindicator" "dbus-glib")
makedepends=("cmake-extras" "glib2" "libayatana-indicator>=0.9.0" "gtk3" "libdbusmenu-gtk3" "systemd" "intltool")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("83b373f6934f1865e307e19020fcc44b")
options=("!emptydirs")

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
