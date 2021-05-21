# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-kaz-tat
pkgver=0.2.1
pkgrel=1
pkgdesc="Apertium translation pair for Kazakh and Tatar"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools' 'vislcg3' 'hfst' 'apertium-kaz' 'apertium-tat')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('58f76085a42f1bacef197948f89275fe38ddbd5702253f7bb22f61e38833f9c0')

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
