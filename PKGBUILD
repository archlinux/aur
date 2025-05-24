# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.6.2
pkgrel=1
pkgdesc="Folder Integrity Checker"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'qmicroz')
makedepends=('cmake')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(a4e9f6d7d345c6f2e8cd0a739c502fbaae2f7cacd11bbd376068aceed974da40)

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
