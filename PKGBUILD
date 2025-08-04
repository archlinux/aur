# Maintainer: Hash <elpoepstudios@gmail.com>
# Contributor: none

pkgname=gamebreaker
pkgdesc="Simple graphics engine for C++"
pkgver=0.0.6
pkgrel=2
arch=(x86_64)
url="https://github.com/elpoeprod/GameBreaker"
license=(BSD-3)
depends=(sdl2 sdl2_image sdl2_ttf sdl2_net)
conflicts=()
makedepends=(make)
source=("GameBreaker-${pkgver}.tar.gz::https://github.com/elpoeprod/GameBreaker/archive/v${pkgver}.tar.gz")
md5sums=('187966a6f3832870754084d1da67863b')

build(){
	cd "${srcdir}/GameBreaker-${pkgver}"
	make
}

package(){
	cd "${srcdir}/GameBreaker-${pkgver}"

	mkdir -p "$pkgdir/usr/local/include/gamebreaker/"
	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/share/licenses/gamebreaker/LICENSE"
	
	cp -drf include/* "$pkgdir/usr/local/include/gamebreaker/"
	cp "libgb.so" "$pkgdir/usr/lib/libgb.so"
	cp "LICENSE" "$pkgdir/usr/share/licenses/gamebreaker/LICENSE"
}
