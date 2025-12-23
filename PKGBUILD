# Maintainer: rotkonetworks <hq@rotko.net>
# PGP: 813CE099D6CE512BC29A15D841EE1853489958D6

pkgname=sxhkd1
pkgver=1.0.2
pkgrel=1
pkgdesc="simple x hotkey daemon"
arch=('x86_64')
url="https://github.com/rotkonetworks/sxhkd"
license=('BSD-2-Clause')
depends=('libxcb' 'xcb-util-keysyms')
makedepends=('git')
provides=('sxhkd')
conflicts=('sxhkd')
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "sxhkd"
	git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
	cd "sxhkd"
	make
}

package() {
	cd "sxhkd"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
