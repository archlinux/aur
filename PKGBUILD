# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-bel-rus
pkgver=0.2.1
pkgrel=1
pkgdesc="Apertium translation pair for Belarusian and Russian"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools>=0.2.5' 'vislcg3>=1.3.0' 'apertium-bel' 'apertium-rus')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6ce3724608ee7670fc0fb98a47134927dfaa40a4a350f587c0db9f5f6977a8b1')

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
