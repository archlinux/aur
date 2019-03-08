# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-datetime"
pkgver=git_r2080
pkgrel=1
pkgdesc="Ayatana Indicator providing clock and calendar"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("glib2" "evolution-data-server")
makedepends=("cmake" "cmake-extras" "dbus" "intltool" "glib2" "libnotify" "gstreamer" "libical" "evolution-data-server" "gsettings-desktop-schemas" "properties-cpp")
optdepends=("mate-ayatana-indicator-applet" "geoclue")
source=("git+https://github.com/AyatanaIndicators/${pkgname}.git")
md5sums=("SKIP")
options=("!emptydirs")

pkgver()
{
    cd ${pkgname}
    echo "git_r$(git rev-list --count HEAD)"
}

build()
{
    cd ${pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -Denable_tests=OFF
    make
}

package()
{
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
