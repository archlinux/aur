# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>
pkgname=siproxd
pkgver=0.8.4
pkgrel=1
pkgdesc="A masquerading SIP proxy server"
arch=('i686' 'x86_64')
url="http://siproxd.sourceforge.net/"
license=('GPL-2.0')
#makedepends=('')
depends=('libosip2')
#source=("https://sourceforge.net/projects/siproxd/files/siproxd/${pkgver}/siproxd-${pkgver}.tar.gz/download")
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('75d0075e04e37485e05a79d55b88919a')
sha256sums=('ad5b9bf24713aed02906507a503ed0c85e26921c9bea63c72adac4a5ee39e416')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/siproxd

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
}
