# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-datetime"
pkgver="0.8.3"
pkgrel="1"
pkgdesc="Ayatana Indicator providing clock and calendar"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("libayatana-indicator" "glib2" "evolution-data-server" "libaccounts-glib")
makedepends=("libayatana-indicator" "cmake" "cmake-extras" "dbus" "intltool" "glib2" "libnotify" "gstreamer" "libical" "evolution-data-server" "gsettings-desktop-schemas" "properties-cpp")
optdepends=("geoclue")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("cc87b99eaa7be3dd134e3070613ef942")
options=("!emptydirs")

build()
{
    cd ${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -Denable_tests=OFF
    make
}

package()
{
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
