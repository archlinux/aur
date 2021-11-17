# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-messages"
pkgver="0.8.2"
pkgrel="1"
pkgdesc="Ayatana Indicator that collects messages that need a response"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-messages"
license=("GPL3")
makedepends=("cmake-extras" "glib2" "gobject-introspection" "gtk-doc" "intltool" "vala" "systemd")
depends=("accountsservice" "hicolor-icon-theme" "dconf")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("1c43e8cfe56ad4732984938c3fdd14d7")
provides=("indicator-messages")
conflicts=("indicator-messages")

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
