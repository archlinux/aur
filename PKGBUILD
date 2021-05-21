# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-separable
pkgver=0.3.6
pkgrel=1
pkgdesc="Module for reordering separable/discontiguous multiwords."
url="https://wiki.apertium.org/wiki/Apertium_separable"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc')
depends=('apertium>=3.4.2' 'zlib')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium-separable/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1da08205427e96ac7b812e66daa60a9f57fac2dbcec7a382fb074f74d268c9c4')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
