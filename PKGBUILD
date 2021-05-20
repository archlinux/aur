# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-hin
pkgver=0.1.0
pkgrel=1
pkgdesc="Apertium linguistic data for Hindi"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6385fe2785fc1179d3fab94778a99b543d7f50c4f1749c10e86af8723ce56d75')

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
