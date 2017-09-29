# Maintainer: atomicbeef <teddyg522@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor:  Elder Marco <eldermarco at gmail dot com>

pkgname=purple-events
pkgver=0.99.1
pkgrel=2
pkgdesc="libpurple events handling plugin and library"
license=('GPL3')
url="https://github.com/sardemff7/purple-events"
source=("https://github.com/sardemff7/purple-events/archive/v0.99.1.tar.gz")
makedepends=('perl-xml-parser' 'intltool')
depends=('glib2' 'libpurple')
arch=('i686' 'x86_64')
md5sums=('1d0c650950201ce9b5e7049580289f23')

build () {
	cd "$srcdir/$pkgname-$pkgver"

    ./autogen.sh
	./configure --prefix=/usr
	make
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
