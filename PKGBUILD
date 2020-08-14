# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio-sacd-bzr"
_pkgname="odio-sacd"
pkgver="20.5.11.5"
pkgrel="1"
pkgdesc="SACD decoder"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/odio-sacd"
license=("GPL3")
depends=("libodiosacd")
makedepends=("breezy" "gcc" "libodiosacd")
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
