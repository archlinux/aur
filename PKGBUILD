# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-ind
pkgver=0.2.0
pkgrel=1
pkgdesc="Apertium linguistic data for Indonesian"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bbddad0507a8158835a8d980453fcd8e4dd88f1c9074f35c8cc390c256938891')

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
