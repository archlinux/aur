# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-tur
pkgver=0.2.0
pkgrel=1
pkgdesc="Apertium linguistic data for Turkish"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3' 'hfst')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff154fca38e1604c0acbc40023b6d28a0352e087b387756186b96fd072efd8c6')

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
