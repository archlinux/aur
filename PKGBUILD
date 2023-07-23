# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.2.3
pkgrel=2
pkgdesc="A simple tool for checking folder-wide data integrity"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt5-base')
makedepends=('make' 'gcc')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(c46d9d7bc9c698d3a0a9edd56126f66a90f1f3491831f54aafa783cace95babc)

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
