# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-eo-es
pkgver=0.9.2
pkgrel=1
pkgdesc="Apertium translation pair for Esperanto and Spanish"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('24de8b61f8ed288a3384dedfe5c1914275e5c30f28f53354b0e2d627502dc0ca')

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
