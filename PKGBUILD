# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-por
pkgver=0.3.0
pkgrel=1
pkgdesc="Apertium linguistic data for Portuguese"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('95d72d4d81b381de4b9292238f9c1a024d8e05c8835d8ba94540cd9673fe0ca0')

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
