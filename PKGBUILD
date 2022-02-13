# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio-edit"
pkgver="21.11.13"
pkgrel="1"
pkgdesc="A lightweight audio wave editor"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/odio-edit"
license=("GPL3")
depends=("gst-plugins-base" "gtk3" "dconf" "gst-libav" "libodiosacd")
makedepends=("gst-plugins-base-libs" "gtk3" "libodiosacd")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("0993dc9c4d6c14ce6948cc614317cba9")
options=("!emptydirs")

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}
