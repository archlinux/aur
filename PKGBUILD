# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.6.3
pkgrel=1
pkgdesc="Folder Integrity Checker"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'qmicroz')
makedepends=('cmake')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(d46cb8ca4566df48b4bf0a95f87c112ee528ab492d1b5402faa5909a6e953bff)

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
