# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-mlt-ara
pkgver=0.2.1
pkgrel=1
pkgdesc="Apertium translation pair for Maltese and Arabic"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dfc78a97048baeb2e4939a0944800191b018eb6b09a6d43aebf024cf185558fa')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
