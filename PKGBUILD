
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-widgets
pkgver=2.0
pkgrel=1
pkgdesc="Contemporary Widget Theme"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/contemporary-theme"
license=('GPL3')
depends=('libcontemporary')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("$pkgname-$pkgver"::"https://github.com/theCheeseboard/contemporary-theme/archive/v$pkgver.tar.gz")
sha256sums=('4be56bfe3279503cccc6bba782225e0924c884899e316ef52c1e1e057b0639ec')

build() {
	cmake -B build -S "contemporary-theme-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
