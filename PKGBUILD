# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-hbs-slv
pkgver=0.5.1
pkgrel=1
pkgdesc="Apertium translation pair for Serbo-Croatian and Slovenian"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools' 'vislcg3' 'apertium-hbs')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('58e3451acb8d0675cd00fe8a7fdb75974da86d3dfbccba9253bca4e5608c83c8')

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
