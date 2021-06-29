# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-application"
pkgver="0.8.0"
pkgrel="1"
pkgdesc="Ayatana Application Indicators"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-application"
license=("GPL3")
depends=("libayatana-appindicator" "dbus-glib")
makedepends=("cmake-extras" "glib2" "libayatana-indicator" "gtk3" "libdbusmenu-gtk3" "systemd" "intltool")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("aeba0273e91f814fb808e0c963bbac71")
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
