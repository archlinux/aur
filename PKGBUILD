# Maintainer: TheRetikGM <theretikgm@gmail.com>
pkgname="swic-git"
pkgver=0.2
pkgrel=1
pkgdesc="Sway input configuration helper tool"
arch=('x86_64')
url="https://github.com/theretikgm/swic"
license=('MIT')
depends=('glfw>=3.3.8' 'sway')
makedepends=('git' 'meson' 'glfw' 'gcc' 'ninja')
optdepends=('slurp')
source=("$pkgname-$pkgver::git+https://github.com/theretikgm/swic")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	meson setup build
	meson compile -C build
}

check() {
	cd "$pkgname-$pkgver"
	test -f build/swic
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/swic "$pkgdir/usr/bin/swic"
}
