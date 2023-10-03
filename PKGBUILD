# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thetroposphere
pkgver=1.0
pkgrel=1
pkgdesc="Weather"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thetroposphere"
license=('GPL3')
depends=('libcontemporary')
makedepends=('git' 'qt6-tools' 'qt6-positioning' 'cmake' 'clang')
source=("thetroposphere"::"https://github.com/theCheeseboard/theTroposphere/archive/v$pkgver.tar.gz")
sha256sums=('fe728c121cda29e88067e32e05bcf345a67c13d390c41863d013bb37601e0d63')

build() {
	cmake -B build -S "theTroposphere-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
