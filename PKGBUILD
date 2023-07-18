# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theterminal
pkgver=4.0
pkgrel=1
pkgdesc="Simple Terminal Emulator"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/theterminal"
license=('GPL3')
depends=('xdg-utils' 'tttermwidget')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("theterminal"::"https://github.com/theCheeseboard/theterminal/archive/v$pkgver.tar.gz")
sha256sums=('985e820fbc3ff2d70807474813cb0efbc38ef4616400e57055b2f18bcf266323')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
