# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=the24
pkgver=2.0
pkgrel=1
pkgdesc="Clock app"
arch=("x86_64" "aarch64")
url="https://github.com/vicr123/the24"
license=('GPL3')
depends=('libcontemporary')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("the24"::"https://github.com/vicr123/the24/archive/v$pkgver.tar.gz")
sha256sums=('af9bc22a32bde97ee05f74d15ff3cc8749b16c6a5f878c55b778b84a2c6eb879')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
