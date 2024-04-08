# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-sound"
pkgver="24.4.0"
pkgrel="1"
pkgdesc="Ayatana system sound indicator"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-sound"
license=("GPL3")
makedepends=("cmake-extras" "intltool" "vala" "systemd" "glib2" "libxml2" "gobject-introspection")
depends=("accountsservice" "libpulse" "libgee" "libnotify" "libayatana-common>=0.9.9")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("321b40f4c24c5d6986081d589a9d37dc")

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
