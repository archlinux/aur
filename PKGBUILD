# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thepage
pkgver=1.0
pkgrel=0
pkgdesc="Document Viewer using poppler"
arch=("x86_64")
url="https://github.com/vicr123/thepage"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'the-libs' 'qt5-svg' 'poppler-qt5')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/thepage/archive/v1.0.tar.gz")
sha256sums=('6ec74fe265cbb864d51dada54056053235646a7a69437ddbb037bdc624abfef5')

build() {
	cd "thePage-$pkgver"
	mkdir -p build
	cd build
	qmake ../thePage.pro
	make
}

package() {
	cd "thePage-$pkgver"
	cd build
	make install INSTALL_ROOT=$pkgdir
}
