# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=gnuais
pkgver=0.3.1
pkgrel=1
pkgdesc="Open source software for demodulating and decoding AIS messages"
arch=('x86' 'x86_64')
url="http://gnuais.sourceforge.net/"
license=('GPL2')
depends=('libpulse' 'curl' 'osm-gps-map' 'libmysqlclient')
makedepends=('cmake')
source=(https://github.com/rubund/gnuais/archive/$pkgver.zip)
md5sums=('f9fc0222f974abaf9e142cfb77d4e9fb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
