# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-nno-nob
pkgver=1.3.0
pkgrel=1
pkgdesc="Apertium translation pair for Norwegian Nynorsk and Norwegian Bokmål"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf')
depends=('apertium>=3.6.0' 'apertium-lex-tools>=0.2.5' 'vislcg3>=1.3.0' 'apertium-nno' 'apertium-nob')
replaces=('apertium-nn-nb')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4d12ed7758628069bcf8a6a16a02c481de180093d74acab0acb357a88eaa3f7b')

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
