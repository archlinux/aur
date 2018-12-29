# Maintainer: Your Name <youremail@domain.com>
pkgname=libtxc_dxtn
pkgver=1.0.1
pkgrel=1
pkgdesc="the S3TC algorithm, needed by wine-staging DXTn patches"
arch=('x86_64' 'i386')
url="http://dri.freedesktop.org/wiki/S3TC"
license=('BSD')
depends=('mesa')
provides=('libtxc_dxtn')
source=("http://people.freedesktop.org/~cbrill/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('7105107f07ac49753f4b61ba9d0c79c5')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

