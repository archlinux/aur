# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio-edit"
pkgver="21.4.30"
pkgrel="1"
pkgdesc="A lightweight audio wave editor"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/odio-edit"
license=("GPL3")
depends=("gst-plugins-base" "gtk3" "dconf" "gst-libav" "libodiosacd")
makedepends=("gst-plugins-base-libs" "gtk3" "libodiosacd")
source=("https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("f98d15383c95793203f2deeba2da8bd3")
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
