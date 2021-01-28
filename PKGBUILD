# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-notifications"
pkgver="0.8.90"
pkgrel="1"
pkgdesc="Ayatana Indicator for viewing recent notifications"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("glib2" "libayatana-indicator")
makedepends=("intltool" "libayatana-indicator" "glib2" "gdk-pixbuf2" "gtk3" "mate-common")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("c1197b1e1b8e10a9648937012b3b2812")
options=("!emptydirs")

prepare()
{
    cd ${pkgname}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib --disable-static
    make
}

package()
{
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

