# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-hbs-mkd
pkgver=0.1.1
pkgrel=2
pkgdesc="Apertium translation pair for Serbo-Croatian and Macedonian"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('43939c831164d6e80b1655f2d890d5605a3300ea9bf91aac3a2891eb6981d3be')

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
