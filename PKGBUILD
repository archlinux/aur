# Contributor: MCMic <come.bernigaud@laposte.net>
# Contributor: Cravix (AUR)
# Maintainer: SanskritFritz

pkgname=meandmyshadow
pkgver=0.5
pkgrel=1
pkgdesc="Puzzle/platform game in which you try to reach the exit by solving puzzles."
arch=('i686' 'x86_64')
url="http://meandmyshadow.sourceforge.net/"
license=('GPL3')
depends=('sdl_gfx' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'curl' 'libarchive' 'hicolor-icon-theme' 'libgl')
makedepends=('make' 'cmake')
source=("https://sourceforge.net/projects/meandmyshadow/files/$pkgver/meandmyshadow-$pkgver-src.tar.gz")
md5sums=('bfbe6045ff29ae426e7637f158ec031e')

prepare() {
	cd "$pkgname-$pkgver"
# 	sed -i 's|Find_Package (Lua REQUIRED)|Find_Package (Lua 5.2 EXACT REQUIRED)|' CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR=${pkgdir}
}
