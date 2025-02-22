# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-sound"
pkgver="24.5.2"
pkgrel="1"
pkgdesc="Ayatana system sound indicator"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-sound"
license=("GPL-3.0-or-later")
makedepends=("cmake-extras" "intltool" "vala" "systemd" "libxml2" "gobject-introspection")
depends=("accountsservice" "libpulse" "libgee" "libnotify" "libayatana-common" "glibc" "glib2" "dconf")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("93f6d0cd49065feb2c434a51b915b44a")

build()
{
    cd ${pkgname}-${pkgver}
    cmake -S . -B build -DCMAKE_INSTALL_LIBEXECDIR='lib'
    cmake --build build
}

package()
{
    cd ${pkgname}-${pkgver}
    DESTDIR="${pkgdir}" cmake --install build
}
