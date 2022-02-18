# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-sound"
pkgver="22.2.0"
pkgrel="1"
pkgdesc="Ayatana system sound indicator"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-sound"
license=("GPL3")
makedepends=("cmake-extras" "intltool" "vala" "systemd" "glib2" "libxml2" "gobject-introspection")
depends=("accountsservice" "libpulse" "libgee" "libnotify" "libayatana-common>=0.9.5")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("eb83002984ffa62ffe30b899e1a735e4")

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
