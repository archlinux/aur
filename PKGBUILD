# Maintainer: Grady Link <aur@grady.link>
pkgname="scratch-everywhere"
pkgver=1.2
pkgrel=1
pkgdesc="A custom Scratch runtime written in C++!"
arch=('any')
url="https://github.com/ScratchEverywhere/ScratchEverywhere"
license=('LGPL-3.0-only')
depends=('curl' 'mesa' 'glfw' 'libpulse' 'miniz' 'luajit' 'stb')
makedepends=('cmake' 'git')
source=("ScratchEverywhere-$pkgver.tar.gz::https://github.com/ScratchEverywhere/ScratchEverywhere/archive/$pkgver.tar.gz")
sha256sums=(09c222a7d39a78ac4ee7c3e421d4f17246335e1ce4a6a6935b88fe42c6fd0214)

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
