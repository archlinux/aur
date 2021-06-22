arch=(any)
backup=(etc/shiromino.ini)
conflicts=(shiromino-git)
depends=(
	libvorbis
	sdl2
	sdl2_image
	sdl2_mixer
	sqlite
)
license=(MIT)
makedepends=(
	cmake
	pkgconf
)
pkgdesc="A fast-paced puzzle game with roots in the arcade"
pkgname=shiromino
pkgrel=2
pkgver='0.2.1'
sha256sums=('9fd6b8f7b391df648c3b87c6b11b269d180f2b8c202512e0d22c9cfc5dc6cdc6')
url=https://github.com/shiromino/shiromino
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
build() {
	cd "$srcdir/shiromino-$pkgver"
	cmake\
		-B build\
		-DCMAKE_BUILD_TYPE=Release\
		-S .
	cmake --build build
}
package() {
	cmake --install "$srcdir/shiromino-$pkgver/build" --prefix "$pkgdir" --strip
}
