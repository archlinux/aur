# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-messages"
pkgver="24.5.1"
pkgrel="1"
pkgdesc="Ayatana Indicator that collects messages that need a response"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-messages"
license=("GPL-3.0-or-later")
makedepends=("cmake-extras" "gobject-introspection" "gtk-doc" "intltool" "vala" "systemd" "glib2-devel")
depends=("accountsservice" "hicolor-icon-theme" "dconf" "glib2" "glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("65f4d12358e67254b2cd5518b99664cd")
provides=("indicator-messages")
conflicts=("indicator-messages")

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
