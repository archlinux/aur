# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-lex-tools
pkgver=0.3.1
pkgrel=1
pkgdesc="Module for compiling lexical selection rules and processing them in the pipeline."
url="https://wiki.apertium.org/wiki/Constraint-based_lexical_selection_module"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'flex' 'autoconf' 'automake' 'libtool' 'zlib')
depends=('apertium' 'lttoolbox')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium-lex-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('113e65de15634c7d3fbb9322a7edc09107ebf8bdf1169fd1eb5cce184a017ebb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
