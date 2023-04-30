# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple tool for checking folder-wide data integrity"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt5-base')
makedepends=('make' 'gcc')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(a3b072a9b05635df5e4af468521dd2fb9059ac749e1a1af7b1ad0af4dee82528)

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
