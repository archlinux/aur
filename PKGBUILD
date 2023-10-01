# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.2.4
pkgrel=1
pkgdesc="A simple tool for checking folder-wide data integrity"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt5-base')
makedepends=('make' 'gcc')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(497177dd6da9bd4a67c3ab666c3b8ec9eecd61fba8575e1087e1782ccaeb84fb)

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
