# Maintainer: Benjamin Hodgetts <ben@xnode.org>

pkgname=libretro-tyrquake-git
pkgver=r1597.1b494ee
pkgrel=1
pkgdesc="Tyrquake libretro core (Quake)."
arch=('i686' 'x86_64')
url="http://disenchant.net/tyrquake/"
license=(GPL2)
depends=(sdl2)
groups=('libretro')
makedepends=(git)
source=("git+https://github.com/libretro/tyrquake.git")
sha256sums=('SKIP')

pkgver() {
	cd tyrquake
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd tyrquake
	make QBASEDIR=/usr/share/games/quake
}

package() {
	install -Dm644 "tyrquake/tyrquake_libretro.so" "${pkgdir}/usr/lib/libretro/tyrquake_libretro.so"
}
