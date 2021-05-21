# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-kaz
pkgver=0.1.0
pkgrel=1
pkgdesc="Apertium linguistic data for Kazakh"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3' 'hfst')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ca9e43f08e9f85a2af11318f79b2b533b1d0fe6cafe626947560813d8bc399d9')

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
