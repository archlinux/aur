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
pkgver='0.2.0'
sha256sums=('0f370eb3d0668297bb3437eec6f1ea829010a7a0bb6d5ba77752854104d10c41')
url=https://github.com/shiromino/shiromino
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
build() {
	cd "$srcdir/shiromino-$pkgver"
	cmake\
		-B build\
		-DCMAKE_BUILD_TYPE=Release\
		-DENABLE_OPENGL_INTERPOLATION=1\
		-S .
	cmake --build build
}
package() {
	cmake --install "$srcdir/shiromino-$pkgver/build" --prefix "$pkgdir" --strip
}