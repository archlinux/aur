# Maintainer: Lloyd Henning <lloyd.w.henning@gmail.com>
pkgname=aruco
pkgver=2.0.14
pkgrel=1
pkgdesc="Augmented reality library based on OpenCV"
arch=('i686' 'x86_64')
url="https://www.uco.es/investiga/grupos/ava/node/26"
license=('BSD')
makedepends=(cmake)
source=("http://downloads.sourceforge.net/aruco/$pkgname-$pkgver.zip")
md5sums=('43aa2cd578732884b71c4a0264c413f8')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
