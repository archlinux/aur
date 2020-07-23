# Maintainer: Robert Tari <robert at tari dot in>
# Contributor: Valentin Huélamo <vhuelamo at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010 at ya dot ru>

pkgname="ayatana-indicator-sound"
pkgver=git_r2737
pkgrel=1
pkgdesc="Ayatana system sound indicator"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("pulseaudio" "libayatana-indicator" "glib2" "accountsservice" "dconf" "libnotify" "libgee")
makedepends=("git" "cmake" "cmake-extras" "dbus" "accountsservice" "mate-common" "gsettings-desktop-schemas" "intltool" "vala" "glib2" "libpulse" "libnotify" "libgee" "libxml2" "pulseaudio" "qt5-base" "qt5-declarative" "systemd" "gobject-introspection")
optdepends=("pavucontrol" "mate-media")
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
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -DCMAKE_INSTALL_LOCALSTATEDIR=/var -Denable_tests=OFF
    make
}

package()
{
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
