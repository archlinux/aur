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
pkgrel=3
pkgver='0.2.0'
sha256sums=('314217cc222bb5b0448c83d2e36a0f4254739c9002b23e76dc094aad57296ce2')
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