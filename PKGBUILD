# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>
pkgname=siproxd
pkgver=0.8.3
pkgrel=1
pkgdesc="A masquerading SIP proxy server"
arch=('i686' 'x86_64')
url="http://siproxd.sourceforge.net/"
license=('GPL-2.0')
#makedepends=('')
depends=('libosip2')
#source=("https://sourceforge.net/projects/siproxd/files/siproxd/${pkgver}/siproxd-${pkgver}.tar.gz/download")
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9a9d2c89e5f0c59fdde9444a66d8372c')
sha256sums=('9a6d7a6bb6fff162775b1e1fb7018de9c69642cbf8626185dc6ffceeeba07736')

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
