# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-isl
pkgver=0.1.1
pkgrel=1
pkgdesc="Apertium linguistic data for Icelandic"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('237d7e840609e4d4c6dd35980b5aeca8ab3e52491f98e55fc07db554d1f7b48b')

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
