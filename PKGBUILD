# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.5.1
pkgrel=1
pkgdesc="Data Integrity Checker"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt5-base' 'qt5-svg')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(286cf652264286455259c78bcbf1ba4845b04d6e5bc20e22fe3df6f03d2e4114)

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
