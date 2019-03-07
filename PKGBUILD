# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-datetime"
pkgver=git_r2080
pkgrel=1
pkgdesc="Simple Ayatana clock"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("dconf" "gsettings-desktop-schemas" "libayatana-indicator" "libaccounts-glib" "evolution-data-server" "glib2" "gstreamer" "ayatana-indicator-messages" "libnotify" "libutil-linux" "systemd")
makedepends=("cmake" "cmake-extras" "dbus" "intltool" "glib2" "libnotify" "gstreamer" "libical" "evolution-data-server" "properties-cpp" "gsettings-desktop-schemas" "libaccounts-glib" "ayatana-indicator-messages" "libutil-linux" "systemd")
optdepends=("mate-ayatana-indicator-applet" "mate-control-center")
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
