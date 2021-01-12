# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theshop
pkgver=1.0
pkgrel=0
pkgdesc="Software store"
arch=("x86_64")
url="https://github.com/vicr123/theshop"
license=('GPL3')
depends=('qt5-base' 'the-libs' 'qt5-svg' 'appstream-qt' 'packagekit-qt5')
makedepends=('git' 'qt5-tools' 'libthedesk' 'thedesk')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/theShop/archive/v1.0.tar.gz")
sha256sums=('90f836280fc68eb4a21df25d3633b3276b96ac3fdc4dd7dbba099bbdb504ea33')

build() {
	cd "theShop-$pkgver"
	mkdir -p build
	cd build
	qmake ../theShop.pro
	make
}

package() {
	cd "theShop-$pkgver"
	cd build
	make install INSTALL_ROOT=$pkgdir
}
