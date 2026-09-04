# Maintainer: Hash <elpoepstudios@gmail.com>
# Contributor: none

pkgname=gamebreaker
pkgdesc="Simple graphics engine for C++"
pkgver=0.1.0
pkgrel=2
arch=(x86_64)
url="https://codeberg.org/elpoeprod/GameBreaker"
license=(BSD-3)
depends=(raylib taglib gtk3 enet)
conflicts=()
makedepends=(make)
source=("GameBreaker-${pkgver}.tar.gz::https://codeberg.org/elpoeprod/GameBreaker/archive/v${pkgver}.tar.gz")
md5sums=('8df1d4dcefd0104bcec54e612303f9b2')

build(){
	rename "gamebreaker" "GameBreaker-${pkgver}" "${srcdir}/gamebreaker"
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
