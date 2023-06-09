# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thedesk-xdg-utils
pkgver=1.0
pkgrel=0
pkgdesc="XDG Utilities for theDesk"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thedesk-xdg-utils"
license=('GPL3')
depends=('libtdesktopenvironment')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("$pkgname-$pkgver"::"https://github.com/theCheeseboard/thedesk-xdg-utils/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('550549f9bd82e01d18ad55b16c41496755f9955ea76f15fde6e7c96462c51f6d')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
