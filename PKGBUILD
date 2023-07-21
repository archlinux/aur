# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.2.3
pkgrel=1
pkgdesc="A simple tool for checking folder-wide data integrity"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt5-base')
makedepends=('make' 'gcc')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(e1fe0a6310bab29c5f03fbfe9e4b72b3ae01e168ed0e8f991ab8bc775cba817f)

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	qmake ..
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make install INSTALL_ROOT="${pkgdir}"
}
