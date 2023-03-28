# Arch User Repository PKGBUILD
# Maintainer: Your Name <tmarjeski at gmail dot com>
pkgname=dotris
pkgver=173a54e
pkgrel=1
pkgdesc="A mini Tetris game made with dots"
arch=('any')
url="https://github.com/trevarj/dotris"
license=('GPL')
depends=('ncurses')
makedepends=('git')
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
	git rev-parse --short HEAD
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
