# Maintainer: Marc Riera <marcriera@softcatala.org>
# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium
pkgver=3.9.12
pkgrel=1
pkgdesc="Core tools (driver script, transfer, tagger, formatters) for the FOSS RBMT system Apertium"
url="https://www.apertium.org/"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'autogen' 'flex' 'autoconf' 'automake' 'libtool' 'zlib' 'utf8cpp')
depends=('lttoolbox>=3.7.2' 'expat' 'gawk' 'libxslt' 'pcre' 'gcc-libs' 'libxml2>=2.6.17' 'gettext' 'icu')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1a719e7338898f82891d3c4cbc1fb8bb4f575173df7b7313dd3802176ce234fe')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
