# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-fra
pkgver=1.10.0
pkgrel=1
pkgdesc="Apertium linguistic data for French"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('38a7465a0872500956f2a0a30184436c6d75eb94c93713e9f603682f833f75bd')

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
