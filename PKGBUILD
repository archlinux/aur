# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-ita
pkgver=1.1.1
pkgrel=1
pkgdesc="Apertium linguistic data for Italian"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c50f3eeac42094a5461cbd7dcc63f4b9d0c46c6cc0e6729cb0f59e471a751722')

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
