# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-ukr
pkgver=0.1.1
pkgrel=1
pkgdesc="Apertium linguistic data for Ukrainian"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01275cd32d3d74538b2fb217ff5bdc8a7426a31dc8f5aa91848be2f7cf30c00b')

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
