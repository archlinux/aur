# Maintainer: atomicbeef <teddyg522@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor:  Elder Marco <eldermarco at gmail dot com>

pkgname=purple-events
pkgver=0.99.1
pkgrel=1
pkgdesc="libpurple events handling plugin and library"
license=('GPL3')
url="https://github.com/sardemff7/purple-events"
source=("http://download.tuxfamily.org/purpleevents/purple-events/purple-events-0.99.1.tar.xz")
makedepends=('perl-xml-parser' 'intltool')
depends=('glib2' 'libpurple')
arch=('i686' 'x86_64')
md5sums=('c0471d39c013d39becd00f29e4732f24')

build () {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
