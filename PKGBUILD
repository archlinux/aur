# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-lex-tools
pkgver=0.2.7
pkgrel=1
pkgdesc="Module for compiling lexical selection rules and processing them in the pipeline."
url="https://wiki.apertium.org/wiki/Constraint-based_lexical_selection_module"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'autogen' 'flex' 'autoconf' 'automake' 'libtool' 'zlib')
depends=('apertium')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium-lex-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f8cb74a53210d3868624ba0fb1045692c8d1ba049b7e28089c0153619bfd006')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
