# Maintainer: Hash <elpoepstudios@gmail.com>
# Contributor: none

pkgname=gamebreaker-sdl3
pkgdesc="Simple graphics engine for C++ on SDL3"
pkgver=0.1.1
pkgrel=1
arch=(x86_64)
url="https://codeberg.org/elpoeprod/GameBreaker"
license=(BSD-3)
depends=(sdl3 sdl3_ttf sdl3_image sdl3_mixer alsa-tools libopenmpt enet glm taglib gtk3)
conflicts=(gamebreaker)
makedepends=(make)
source=("GameBreaker-${pkgver}-sdl3.tar.gz::https://codeberg.org/elpoeprod/GameBreaker/archive/v${pkgver}-sdl3.tar.gz")
md5sums=('00fe442cbce58dbb4a8b583a7195c126')

build(){
	rename "gamebreaker" "GameBreaker-${pkgver}-sdl3" "${srcdir}/gamebreaker"
	cd "${srcdir}/GameBreaker-${pkgver}-sdl3"
	mkdir "build"
	make
}

package(){
	cd "${srcdir}/GameBreaker-${pkgver}-sdl3"

	mkdir -p "$pkgdir/usr/local/include/gamebreaker/"
	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/share/licenses/gamebreaker/"
	
	cp -drf include/* "$pkgdir/usr/local/include/gamebreaker/"
	cp "libgb.so" "$pkgdir/usr/lib/libgb.so"
	cp "LICENSE" "$pkgdir/usr/share/licenses/gamebreaker/LICENSE"
}
