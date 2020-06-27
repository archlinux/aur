# Maintainer: PurpleUltraViolet <purple.ultraviolet616@gmail.com>

pkgname=ncmines-git
pkgver=v1.0.3
pkgrel=1
pkgdesc="Terminal-based ncurses"
arch=('i686' 'x86_64')
url="https://github.com/PurpleUltraViolet/ncmines"
license=('MIT')
depends=('ncurses')
makedepends=('git')
source=('ncmines-git::git+https://github.com/PurpleUltraViolet/ncmines.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	make clean
    make all
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
