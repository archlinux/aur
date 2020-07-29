# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-datetime"
pkgver="0.4.1"
pkgrel="1"
pkgdesc="Ayatana Indicator providing clock and calendar"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("glib2" "evolution-data-server" "libaccounts-glib")
makedepends=("cmake" "cmake-extras" "dbus" "intltool" "glib2" "libnotify" "gstreamer" "libical" "evolution-data-server" "gsettings-desktop-schemas" "properties-cpp")
optdepends=("mate-ayatana-indicator-applet" "geoclue")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("0ec75586cd8dbbe2d0eb231f3f4d9b0b")
options=("!emptydirs")

build()
{
    cd ${pkgname}-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -Denable_tests=OFF
    make
}

package()
{
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
