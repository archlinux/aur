# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio-edit-bzr"
_pkgname="odio-edit"
pkgver="20.5.11.24"
pkgrel="1"
pkgdesc="A lightweight audio wave editor"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/odio-edit"
license=("GPL3")
depends=("gst-plugins-base" "gtk3" "dconf" "gst-libav" "libodiosacd")
makedepends=("breezy" "gcc" "gst-plugins-base-libs" "gtk3" "libodiosacd")
source=("bzr+lp:${_pkgname}")
md5sums=("SKIP")
options=("!emptydirs")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

build()
{
    cd ${srcdir}/${_pkgname}
    make
}

package()
{
    cd ${srcdir}/${_pkgname}
    make DESTDIR="$pkgdir/" install
}
