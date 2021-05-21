# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-isl-swe
pkgver=0.1.1
pkgrel=1
pkgdesc="Apertium translation pair for Icelandic and Swedish"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7f13489cfeb524dc12d9b346089814acca280ee2b54236c7afe2aaf389b4a195')

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
