# Maintainer: Grady Link <aur@grady.link>
pkgname="scratch-everywhere"
pkgver=1.0
pkgrel=1
pkgdesc="A custom Scratch runtime written in C++!"
arch=('any')
url="https://github.com/ScratchEverywhere/ScratchEverywhere"
license=('LGPL-3.0-only')
depends=('curl' 'sdl2' 'sdl2_ttf' 'miniz' 'luajit' 'stb')
makedepends=('cmake' 'git')
source=("ScratchEverywhere-$pkgver.tar.gz::https://github.com/ScratchEverywhere/ScratchEverywhere/archive/$pkgver.tar.gz")
sha256sums=(7181436af156f9beb5eab8aa1111b0178bcadde5056e69ec51b2f59100ed7bef)

build() {
	cd "ScratchEverywhere-$pkgver"
	cmake -B build
	cmake --build build
}

package() {
	cd "ScratchEverywhere-$pkgver"
	install -Dm755 build/scratch-pc $pkgdir/usr/bin/scratch-pc
	install -Dm644 gfx/linux/scratch-everywhere.desktop $pkgdir/usr/share/applications/scratch-everywhere.desktop
	install -Dm644 gfx/linux/scratch-everywhere.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/scratch-everywhere.svg
}
