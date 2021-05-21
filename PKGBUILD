# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-cat-ita
pkgver=0.2.1
pkgrel=2
pkgdesc="Apertium translation pair for Catalan and Italian"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools>=0.2.5' 'vislcg3>=1.3.0' 'apertium-cat' 'apertium-ita')
replaces=('apertium-ca-it')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9982f9a48d69cb064a111b88901db72ed3c7e677f4059f0577f0c793ffd337e9')

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
