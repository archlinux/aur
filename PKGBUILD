# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-isl-eng
pkgver=0.1.1
pkgrel=1
pkgdesc="Apertium translation pair for Icelandic and English"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3' 'apertium-isl')
replaces=('apertium-is-en')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4fdc24a70ceb485fa465888297f94d67b13444e53697ac71e9ce871b0b8db4b0')

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
