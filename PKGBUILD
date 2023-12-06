# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple tool for checking folder-wide data integrity"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt5-base')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(507d81b1f7f0a5869e228ebc286e23be9867d1398b8eea5db94e56ebe11423c0)

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
