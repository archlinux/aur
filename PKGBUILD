# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=apertium-mkd-bul
pkgver=0.2.1
pkgrel=1
pkgdesc="Apertium translation pair for Macedonian and Bulgarian"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'vislcg3')
replaces=('apertium-mk-bg')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e050cfad0da8186b455dacdeecc1be031601e65b3702b69b596f9700739f6a0e')

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
