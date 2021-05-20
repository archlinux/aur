# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-br-fr
pkgver=0.5.1
pkgrel=1
pkgdesc="Apertium translation pair for Breton and French"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf')
depends=('apertium>=3.4.2' 'vislcg3>=1.3.0')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a2ce4138985f9d6d7332fcf3de70b4d7ed53337c958436ef0d5372a67e0e593')

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
