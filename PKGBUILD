# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libodiosacd"
pkgver="23.1.31"
pkgrel="1"
pkgdesc="SACD decoder (shared library)"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/libodiosacd"
license=("GPL3")
makedepends=("glibc")
depends=("glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("ae69c316b23b965f33f707d2070d407a")
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
