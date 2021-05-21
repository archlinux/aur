# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-pol
pkgver=0.1.1
pkgrel=1
pkgdesc="Apertium linguistic data for Polish"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2af501ed5054d9f27c15aa3ffc50175d695933cbf407d34bfa733fcf9f5cab9c')

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
