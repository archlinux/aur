# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-afr-nld
pkgver=0.3.0
pkgrel=1
pkgdesc="Apertium translation pair for Afrikaans and Dutch"
url="https://github.com/apertium/${pkgname}"
license=('GPL2')
makedepends=('pkgconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools>=0.2.5' 'vislcg3>=1.3.0' 'apertium-afr' 'apertium-nld')
replaces=('apertium-af-nl')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de1ca75aac06d596e075fcd88ab6e4c70c92cc33dad8c2e986e49ba7c6342947')

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
