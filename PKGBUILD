# Maintainer: Cody Schafer <dev@codyps.com>

pkgrel=1
pkgname=hcxtools
pkgver=4.2.0
pkgdesc="Portable solution for capturing wlan traffic and conversion to hashcat and jtr formats"
license=('MIT')
arch=('i686' 'x86_64')

url="https://github.com/ZerBea/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZerBea/$pkgname/archive/$pkgver.tar.gz")

md5sums=('d8c67788aeb833783fd057244d933f20')

makedepends=('make' 'gcc')

depends=('curl' 'libpcap' 'zlib' 'openssl')

build () {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir PREFIX=/usr INSTALLDIR=$pkgdir/usr/bin install
}
