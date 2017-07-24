# Maintainer: Lloyd Henning <lloyd.w.henning@gmail.com>
pkgname=aruco
pkgver=2.0.19
pkgrel=1
pkgdesc="Augmented reality library based on OpenCV"
arch=('i686' 'x86_64')
url="https://www.uco.es/investiga/grupos/ava/node/26"
license=('BSD')
depends=(opencv)
makedepends=(cmake)
source=("http://downloads.sourceforge.net/aruco/$pkgname-$pkgver.zip")
md5sums=('b5a24f87f1cb36256b4d276e5a9bff84')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
