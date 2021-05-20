# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-hbs
pkgver=0.5.0
pkgrel=1
pkgdesc="Apertium linguistic data for Serbo-Croatian"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ca7e82e7bf8eb54f0e765222bf0dbcc2e00bb15ef495c967ee8aef909289acf')

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
