# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=oreo-cursors-git
pkgver=r4.34dc4ed
pkgrel=2
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make clean
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
