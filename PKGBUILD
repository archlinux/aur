# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium
pkgver=3.7.1
pkgrel=1
pkgdesc="Core tools (driver script, transfer, tagger, formatters) for the FOSS RBMT system Apertium"
url="https://www.apertium.org/"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'autogen' 'flex' 'autoconf' 'automake' 'libtool' 'zlib')
depends=('lttoolbox>=3.5.0' 'expat' 'gawk' 'libxslt' 'pcre' 'gcc-libs' 'libxml2' 'gettext')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8dd0dc1332ee578acf31de50bdbb5ead2b62bdfd7003d3eb959dad9c9a530a33')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
