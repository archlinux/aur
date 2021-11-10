# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium
pkgver=3.7.2
pkgrel=1
pkgdesc="Core tools (driver script, transfer, tagger, formatters) for the FOSS RBMT system Apertium"
url="https://www.apertium.org/"
license=('GPL2')
makedepends=('pkgconf' 'gcc' 'make' 'autogen' 'flex' 'autoconf' 'automake' 'libtool' 'zlib')
depends=('lttoolbox>=3.5.0' 'expat' 'gawk' 'libxslt' 'pcre' 'gcc-libs' 'libxml2' 'gettext')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d415f1fe27ee0c20a0b0e8e8314c7c8b52b830f0e6427db538d402d8a3cb7924')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
