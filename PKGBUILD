# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-arg-cat
pkgver=0.2.0
pkgrel=1
pkgdesc="Apertium translation pair for Aragonese and Catalan"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools>=0.2.5' 'vislcg3>=1.3.0' 'apertium-arg' 'apertium-cat')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc2223d8a6d9f89744b4b8a54a82e303af65113626707f77d035726d03f78dfe')

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
