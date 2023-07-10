# Maintainer: TheRetikGM <theretikgm@gmail.com>
pkgname="swic-git"
pkgver=0.2.4
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
	git checkout 5e7a1f2d2059ea512756ce0ac157f03f88688555
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
