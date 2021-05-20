# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-swe-dan
pkgver=0.8.1
pkgrel=1
pkgdesc="Apertium translation pair for Swedish and Danish"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf')
depends=('apertium>=3.6.0' 'apertium-lex-tools>=0.2.5' 'vislcg3>=1.3.0' 'apertium-swe' 'apertium-dan')
replaces=('apertium-sv-da')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a91be53fc61062e157a241bea591c056d454a790df5bf9b6736ab29823ab7b08')

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
