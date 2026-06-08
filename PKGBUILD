# Maintainer: Grady Link <aur@grady.link>
pkgname="scratch-everywhere"
pkgver=1.0_rc3
pkgrel=1
pkgdesc="A custom Scratch runtime written in C++!"
arch=('any')
url="https://github.com/ScratchEverywhere/ScratchEverywhere"
license=('LGPL-3.0-only')
depends=('curl' 'sdl2' 'sdl2_ttf' 'miniz')
makedepends=('cmake' 'git')
source=("ScratchEverywhere-$pkgver.tar.gz::https://github.com/ScratchEverywhere/ScratchEverywhere/archive/1.0-rc3.tar.gz")
sha256sums=(9807571214d60b365066888a1319425d9590d9a521bb40d5901db018f9fb0c90)

build() {
	cd "ScratchEverywhere-1.0-rc3"
	cmake -B build
	cmake --build build
}

package() {
	cd "ScratchEverywhere-1.0-rc3"
	install -Dm755 build/scratch-pc $pkgdir/usr/bin/scratch-pc
	install -Dm644 gfx/linux/scratch-everywhere.desktop $pkgdir/usr/share/applications/scratch-everywhere.desktop
	install -Dm644 gfx/linux/scratch-everywhere.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/scratch-everywhere.svg
}
