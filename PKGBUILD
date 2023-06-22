# Maintainer: Marc Riera <marcriera@softcatala.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-lex-tools
pkgver=0.4.2
pkgrel=1
pkgdesc="Module for compiling lexical selection rules and processing them in the pipeline."
url="https://wiki.apertium.org/wiki/Constraint-based_lexical_selection_module"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'flex' 'autoconf' 'automake' 'libtool' 'zlib' 'utf8cpp')
depends=('apertium' 'lttoolbox')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium-lex-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a5f03fb36e3c28c8338412a2d53b846995bbaa683db042e58aef0058e4e71b4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
