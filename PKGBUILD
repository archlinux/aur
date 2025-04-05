# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.6.0
pkgrel=1
pkgdesc="Data Integrity Checker"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'qmicroz')
makedepends=('cmake')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(d620a1349a8806d4a170ffd4ed8339fa8c6b9e01291b345cacbad49132be382c)

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make install DESTDIR="${pkgdir}"
}
