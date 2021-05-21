# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-rus
pkgver=0.2.1
pkgrel=1
pkgdesc="Apertium linguistic data for Russian"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4c5482e9e7577d9968eaa5ce9b4c63c72168ca123062f6cf1525272d02fe85da')

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
