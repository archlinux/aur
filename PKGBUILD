pkgname=ttyplot-git
pkgver=r22.ac8c3c3
pkgrel=1
pkgdesc="A realtime plotting utility for terminal with data input from stdin"
arch=('x86_64')
license=('Apache 2.0')
url="https://github.com/tenox7/ttyplot"
source=('git+https://github.com/tenox7/ttyplot.git')
sha256sums=('SKIP')
depends=('ncurses')


pkgver() {
 	cd $srcdir/ttyplot
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/ttyplot
	make
}

package() {
	cd $srcdir/ttyplot
	install -D -m755 ttyplot  $pkgdir/usr/bin/ttyplot
}
