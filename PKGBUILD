# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=lttoolbox
pkgver=3.5.4
pkgrel=1
pkgdesc="Finite state compiler, processor and helper tools used by apertium"
url="https://wiki.apertium.org/wiki/Lttoolbox"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make')
depends=('libxml2>=2.6.17' 'gcc-libs')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/lttoolbox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8b4236e1a0b2095878b1860baf295b052bc71dee320991014ef1b8591259eb3e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
