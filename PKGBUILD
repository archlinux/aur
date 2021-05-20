# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-deu
pkgver=0.1.0
pkgrel=1
pkgdesc="Apertium linguistic data for German"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5176b5e9e4a565050f0d9a3c894405ccd61a9db905c793abac81f1efdbe9ce7e')

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
