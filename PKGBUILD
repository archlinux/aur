# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-sound"
pkgver="0.8.0"
pkgrel="1"
pkgdesc="Ayatana system sound indicator"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("pulseaudio" "libayatana-indicator" "glib2" "accountsservice" "dconf" "libnotify" "libgee")
makedepends=("cmake" "cmake-extras" "dbus" "accountsservice" "mate-common" "gsettings-desktop-schemas" "intltool" "vala" "glib2" "libpulse" "libnotify" "libgee" "libxml2" "pulseaudio" "qt5-base" "qt5-declarative" "systemd" "gobject-introspection")
optdepends=("pavucontrol" "mate-media")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("862f0a57eefa7d805b7f997da9d44eb9")
options=("!emptydirs")

build()
{
    cd ${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -DCMAKE_INSTALL_LOCALSTATEDIR=/var -Denable_tests=OFF
    make
}

package()
{
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
