# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-crh
pkgver=0.2.0
pkgrel=1
pkgdesc="Apertium linguistic data for Crimean Tatar"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf')
depends=('apertium>=3.4.2' 'vislcg3' 'hfst')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('60cf80de5db0dfc9889b2618aeaf8352aff18219dc836d5d47d20e3496ca1207')

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
