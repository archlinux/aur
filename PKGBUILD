# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-dan-nor
pkgver=1.4.1
pkgrel=1
pkgdesc="Apertium translation pair for Danish and Norwegian"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools' 'vislcg3' 'apertium-dan' 'apertium-nno' 'apertium-nob')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8fbb3477c8dec05d40d49774e23266fdff51fbc971ccef065314ce7a0ca0aaa3')

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
