# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-urd
pkgver=0.1.1
pkgrel=1
pkgdesc="Apertium linguistic data for Urdu"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('06a3f3a171e4bcb83e9a131dfd45d267b4acd6787d5e0c08e355f5aa62a3c285')

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
