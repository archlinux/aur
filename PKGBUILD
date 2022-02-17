# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-printers"
pkgver="22.2.0"
pkgrel="1"
pkgdesc="Ayatana Indicator showing active print jobs"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("cups" "libayatana-indicator")
makedepends=("intltool" "mate-common" "glib2" "gtk3" "libdbusmenu-glib" "libdbusmenu-gtk3" "libayatana-indicator" "libcups" "systemd")
optdepends=("system-config-printer")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("e188745e4ed863077ad74c9249262703")
options=("!emptydirs")

prepare()
{
    cd ${pkgname}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package()
{
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
