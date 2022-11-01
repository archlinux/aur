# Maintainer: Marc Riera <marcriera@softcatala.org>
# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=lttoolbox
pkgver=3.7.1
pkgrel=1
pkgdesc="Finite state compiler, processor and helper tools used by apertium"
url="https://wiki.apertium.org/wiki/Lttoolbox"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'utf8cpp')
depends=('libxml2>=2.6.17' 'gcc-libs' 'icu')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/lttoolbox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3ad20ca4c1d15522623062c77a0966ea4d81fc2c44045d96fa86eb79c7325bf1')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
