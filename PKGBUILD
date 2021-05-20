# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-eng
pkgver=0.1.0
pkgrel=1
pkgdesc="Apertium linguistic data for English"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('59d4f13c756e55ba0614ff16cfd54c9c89e9c896e872c1ca82a8202b2840c451')

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
