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
pkgrel=1
pkgver=0.1.1
sha256sums=(c2867c118e3106c724496efa6b62a2207ce62108f9d4e1b8cf861609641ea985)
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