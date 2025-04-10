# Maintainer: Marc Riera <marcriera@softcatala.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-lex-tools
pkgver=0.5.0
pkgrel=1
pkgdesc="Module for compiling lexical selection rules and processing them in the pipeline."
url="https://wiki.apertium.org/wiki/Constraint-based_lexical_selection_module"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'flex' 'autoconf' 'automake' 'libtool' 'zlib' 'utf8cpp')
depends=('apertium' 'lttoolbox')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium-lex-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('72a694e91fe9b61dd8b8b8199f21d0b16bc2fadb58ade9e2554089f89a51504f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
