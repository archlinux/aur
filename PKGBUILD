# Maintainer: jcomcl rapcyss@gmail.com

pkgname=umenu
pkgver=1.1.2.g1d7c154
pkgrel=1
pkgdesc="command-line menu (a la dmenu, slmenu) with single-keypress interaction"
arch=('x86_64')
url="https://github.com/JCoMcL/umenu.git"
license=('Unlicense')
depends=('sh')
makedepends=('git')
source=("git+https://github.com/JCoMcL/umenu")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags --long | sed 's/^v//;s/-/./g;q'
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
