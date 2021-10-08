# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: nisk1

pkgname=asap
pkgver=4.0.0
pkgrel=2
pkgdesc="Another Slight Atari Player - library and players for 8-bit Atari music format"
url="http://asap.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=(glibc)
options=(staticlibs)
source=("http://downloads.sourceforge.net/asap/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7612dc0251c13345bd17dbec46cdecd794a50cab5d4b7840471a6bed41933640')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix="/usr" install-asapconv install
}
