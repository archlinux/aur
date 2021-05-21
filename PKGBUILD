# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-oci
pkgver=0.2.0
pkgrel=1
pkgdesc="Apertium linguistic data for Occitan"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b7a88650df4179f61aba2c2ed70c13bdefd73f67d415f5744f6b293d9b35c081')

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
