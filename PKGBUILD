# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=gnuais
pkgver=0.3.3
pkgrel=1
pkgdesc="Open source software for demodulating and decoding AIS messages"
arch=('x86' 'x86_64')
url="http://gnuais.sourceforge.net/"
license=('GPL2')
depends=('libpulse' 'curl' 'osm-gps-map' 'libmysqlclient')
makedepends=('cmake')
source=(https://github.com/rubund/gnuais/archive/$pkgver.zip)
md5sums=('b3ef68d11d79315864912699a0881d32')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
