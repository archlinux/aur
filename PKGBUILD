# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-crh-tur
pkgver=0.3.0
pkgrel=1
pkgdesc="Apertium translation pair for Crimean Tatar and Turkish"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools' 'vislcg3' 'hfst' 'apertium-crh' 'apertium-tur')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('95f41fb0839c38097ef45fa51d69dd39e226dcd01ccbb774b4b3351c765a76f8')

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
