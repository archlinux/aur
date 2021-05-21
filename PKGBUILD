# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-cat-srd
pkgver=1.1.0
pkgrel=1
pkgdesc="Apertium translation pair for Catalan and Sardinian"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools' 'vislcg3' 'apertium-cat' 'apertium-srd')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e296bcd5c7d2975435ef385013bec5be6197cf0a9f5f8eeee118465f7ac662cb')

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
