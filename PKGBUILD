# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.6.1
pkgrel=1
pkgdesc="Data Integrity Checker"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'qmicroz')
makedepends=('cmake')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(f4176db89381e731f17ee6f37bc942514c243bd0ca8e59af20801f799090dfb6)

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
