# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=bspwm-y
pkgver=0.9.10
pkgrel=1
pkgdesc="minimal window manager"
arch=("x86_64")
url="https://github.com/yarob-0/bspwm"
license=('BSD')
depends=("xcb-util" "xcb-util-wm" "xcb-util-keysyms")
makedepends=("make" "git")
optdepends=("sxhkd: to define keyboard and pointer bindings [installed]"
                  "xdo: for the example panel")
provides=("bspwm" "bspc")
source=("bspwm"::"git+https://github.com/yarob-0/bspwm.git")
md5sums=("SKIP")

build() {
	cd bspwm
	make
}

package() {
	cd bspwm
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
