# Contributor: MCMic <come.bernigaud@laposte.net>
# Contributor: Cravix (AUR)
# Maintainer: SanskritFritz

pkgname=meandmyshadow
pkgver=0.5a
pkgrel=3
pkgdesc="Puzzle/platform game in which you try to reach the exit by solving puzzles."
arch=('i686' 'x86_64')
url="http://meandmyshadow.sourceforge.net/"
license=('GPL3')
depends=('sdl2_gfx' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'curl' 'libarchive' 'hicolor-icon-theme' 'libgl')
makedepends=('make' 'cmake')
source=("https://sourceforge.net/projects/meandmyshadow/files/$pkgver/meandmyshadow-$pkgver-src.tar.gz")
md5sums=('314cf2df805e2d094c00eca601a05642')

prepare() {
	cd "$pkgname-$pkgver"
# 	sed -i 's|Find_Package (Lua REQUIRED)|Find_Package (Lua 5.2 EXACT REQUIRED)|' CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR=${pkgdir}
}
