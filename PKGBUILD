# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-spa
pkgver=1.2.2
pkgrel=1
pkgdesc="Apertium linguistic data for Spanish"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de1fcc44703e238f782b71b90741a96fe4a7bd40e434cf7f4e1795a2dc58d1bb')

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
