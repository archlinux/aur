# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-datetime"
pkgver="0.8.1"
pkgrel="1"
pkgdesc="Ayatana Indicator providing clock and calendar"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("glib2" "evolution-data-server" "libaccounts-glib")
makedepends=("cmake" "cmake-extras" "dbus" "intltool" "glib2" "libnotify" "gstreamer" "libical" "evolution-data-server" "gsettings-desktop-schemas" "properties-cpp")
optdepends=("geoclue")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("1076242e8ba819c38aff7d2b4b50d3a7")
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
