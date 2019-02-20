# Maintainer: Joshua Brikman <jbrikman@gmail.com>
pkgname=minesviiper-git
pkgver=r110.04f8849
pkgrel=1
pkgdesc="minesweeper clone with mouse and VT220 support"
arch=('x86_64')
url="https://gir.st/mines.htm"
license=('GPL')
depends=()
makedepends=('git')
provides=("minesviiper")
conflicts=("minesviiper")
source=('git+https://github.com/girst/minesviiper')
md5sums=('SKIP')

pkgver() {
	cd minesviiper
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd minesviiper
	make
}

package() {
	cd minesviiper
	install -D mines "$pkgdir"/usr/bin/minesviiper
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/minesviiper/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/minesviiper/README.md
}
