# Arch User Repository PKGBUILD
# Maintainer: Your Name <tmarjeski at gmail dot com>
pkgname=dotris-git
pkgver=r11.cde66aa
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd dotris
	make
}

package() {
	cd dotris
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
