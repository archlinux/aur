# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-szl
pkgver=0.1.0
pkgrel=1
pkgdesc="Silesian morphological dictionary for apertium"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ae025483956520e6533273d5bdefded5d0a90316b531d8743f995a22c10d21d')

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
