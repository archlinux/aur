# Maintainer: Victor Tran <vicr12345 at gmail dot com>

pkgname=tttermwidget
pkgver=2.0
pkgrel=2
pkgdesc="Terminal widget used by theTerminal"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/tttermwidget"
license=("GPL2")
depends=("libsm" "libxkbcommon-x11" "libutf8proc" "libcontemporary" "qt6-5compat")
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("tttermwidget"::"https://github.com/theCheeseboard/tttermwidget/archive/v$pkgver.tar.gz")
sha256sums=("41817db1c22a539e6e1a95562d017b624ace0d130327b6165c2f3433afaf6d94")

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
