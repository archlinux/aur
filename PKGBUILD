# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theheartbeat
pkgver=2.0
pkgrel=1
pkgdesc="System Monitor"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/theheartbeat"
license=('GPL3')
depends=('libcontemporary')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("theheartbeat"::"https://github.com/theCheeseboard/theHeartbeat/archive/v$pkgver.tar.gz")
sha256sums=('a1e98b2bf415a50e289630f0f0c160fdf4c21728e1c768f86375481101a49362')

build() {
	cmake -B build -S "theHeartbeat-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
