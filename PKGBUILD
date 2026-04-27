# Maintainer: Grady Link <aur@grady.link>
pkgname="scratch-everywhere"
pkgver=0.40
pkgrel=1
pkgdesc="A custom Scratch runtime written in C++!"
arch=('any')
url="https://github.com/ScratchEverywhere/ScratchEverywhere"
license=('LGPL-3.0-only')
depends=('curl' 'sdl2' 'sdl2_ttf' 'miniz')
makedepends=('cmake' 'git')
source=("ScratchEverywhere-$pkgver.tar.gz::https://github.com/ScratchEverywhere/ScratchEverywhere/archive/$pkgver.tar.gz")
sha256sums=(2a860ac1baff1b74daf14e61ba88bc7c24d474a1d845ef96ac4700d34ad33d43)

build() {
	cd "ScratchEverywhere-$pkgver"
	cmake -B build
	cmake --build build
}

package() {
	cd "ScratchEverywhere-$pkgver"
	install -Dm755 build/scratch-everywhere $pkgdir/usr/bin/scratch-everywhere
	install -Dm644 gfx/linux/scratch-everywhere.desktop $pkgdir/usr/share/applications/scratch-everywhere.desktop
	install -Dm644 gfx/linux/scratch-everywhere.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/scratch-everywhere.svg
}
