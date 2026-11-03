# Maintainer: Grady Link <aur@grady.link>
pkgname="scratch-everywhere"
pkgver=1.3
pkgrel=1
pkgdesc="A custom Scratch runtime written in C++!"
arch=('any')
url="https://github.com/ScratchEverywhere/ScratchEverywhere"
license=('LGPL-3.0-only')
depends=('curl' 'mesa' 'glfw' 'libpulse' 'miniz' 'luajit' 'stb')
makedepends=('cmake' 'git')
source=("ScratchEverywhere-$pkgver.tar.gz::https://github.com/ScratchEverywhere/ScratchEverywhere/archive/$pkgver.tar.gz")
sha256sums=(e1fefd094de7f568b972ea8e8be864ac18602a11cf696fb6edcd7197aaeed32c)

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
