# Maintainer: Justin Dray <justin@dray.be>
# Contributor:  Elder Marco <eldermarco at gmail dot com>

pkgname=purple-events
pkgver=0.2
pkgrel=3
pkgdesc="libpurple events handling plugin and library"
license=('GPL3')
url="https://github.com/sardemff7/purple-events"
source=("https://github.com/downloads/sardemff7/$pkgname/$pkgname-$pkgver.tar.xz")
makedepends=('perl-xml-parser' 'intltool')
options=(!libtool)
depends=('glib2' 'libpurple>=2.6.0')
arch=('i686' 'x86_64')
md5sums=('5cabec53fc7cedeefb59c44f00b08d40')

build () {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

check () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
