# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-tat
pkgver=0.1.0
pkgrel=1
pkgdesc="Apertium linguistic data for Tatar"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3' 'hfst')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ed2778d698d894ef7e2a234a6f1ddd6349671096b6ea4cb971d9ebce649f07c')

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
