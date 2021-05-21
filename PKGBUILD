# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-eo-ca
pkgver=0.9.2
pkgrel=1
pkgdesc="Apertium translation pair for Esperanto and Catalan"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d9802057c7679c541ad46863ace52b9135162093add547aada6c9f98071538e3')

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
