# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-dan
pkgver=0.6.1
pkgrel=1
pkgdesc="Apertium linguistic data for Danish"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf')
depends=('apertium>=3.6.1' 'vislcg3>=1.3.1')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cfc397f594c10a7e88143ab6f0e5ef98b5131159b4829a2bba3582eda7d27256')

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
