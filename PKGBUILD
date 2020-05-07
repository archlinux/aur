# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=oreo-cursors-git
pkgver=20200506
pkgrel=1
pkgdesc="Color material cursors with cute animations."
arch=('any')
url="https://www.pling.com/p/1360254"
license=('GPL2')
makedepends=('git' 'gtk-engine-murrine' 'inkscape' 'xorg-xcursorgen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/varlesh/oreo-cursors.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	make dist
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	make clean
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
