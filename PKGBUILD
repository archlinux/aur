# Maintainer: Hash <elpoepstudios@gmail.com>
# Contributor: none

pkgname=gamebreaker
pkgdesc="Simple graphics engine for C++"
pkgver=0.0.17
pkgrel=1
arch=(x86_64)
url="https://github.com/elpoeprod/GameBreaker"
license=(BSD-3)
depends=(sdl2 sdl2_image sdl2_ttf taglib gtk3 libopenmpt)
conflicts=()
makedepends=(make)
source=("GameBreaker-${pkgver}.tar.gz::https://github.com/elpoeprod/GameBreaker/archive/v${pkgver}.tar.gz")
md5sums=('89cd1519ef69b7579961b10c902886cc')

build(){
	cd "${srcdir}/GameBreaker-${pkgver}"
	make
}

package(){
	cd "${srcdir}/GameBreaker-${pkgver}"

	mkdir -p "$pkgdir/usr/local/include/gamebreaker/"
	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/share/licenses/gamebreaker/"
	
	cp -drf include/* "$pkgdir/usr/local/include/gamebreaker/"
	cp "libgb.so" "$pkgdir/usr/lib/libgb.so"
	cp "LICENSE" "$pkgdir/usr/share/licenses/gamebreaker/LICENSE"
}
