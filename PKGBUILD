# Maintainer: Marc Riera <marcriera@softcatala.org>
# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=lttoolbox
pkgver=3.7.6
pkgrel=1
pkgdesc="Finite state compiler, processor and helper tools used by apertium"
url="https://wiki.apertium.org/wiki/Lttoolbox"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'utf8cpp')
depends=('libxml2>=2.6.17' 'gcc-libs' 'icu')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/lttoolbox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('06cae70c8a0c93a358b84f95e287009ca4d7e732e05b782ac27156bc8ded4762')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
