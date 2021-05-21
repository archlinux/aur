# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-eu-en
pkgver=0.3.2
pkgrel=1
pkgdesc="Apertium translation pair for Basque and English"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b5bdf2814861ce5deb782e19bf55076cff251d832049d7344ab889b57368c718')

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
