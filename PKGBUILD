# Maintainer: rotkonetworks <hq@rotko.net>
# PGP: 813CE099D6CE512BC29A15D841EE1853489958D6

pkgname=bspwm1
pkgver=1.2.0
pkgrel=1
pkgdesc="tiling window manager based on binary space partitioning"
arch=('x86_64')
url="https://github.com/rotkonetworks/bspwm1"
license=('BSD-2-Clause')
depends=('libxcb' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-wm')
makedepends=('git')
optdepends=('sxhkd: keybinding daemon')
provides=('bspwm')
conflicts=('bspwm')
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "bspwm"
	git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
	cd "bspwm"
	make
}

package() {
	cd "bspwm"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
