# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-messages"
pkgver="23.10.0"
pkgrel="1"
pkgdesc="Ayatana Indicator that collects messages that need a response"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-messages"
license=("GPL3")
makedepends=("cmake-extras" "glib2" "gobject-introspection" "gtk-doc" "intltool" "vala" "systemd")
depends=("accountsservice" "hicolor-icon-theme" "dconf")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("b051c879e5cdf5911343ac12ed00a857")
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
