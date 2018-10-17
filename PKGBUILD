pkgname=ttyplot-git
pkgver=r22.ac8c3c3
pkgrel=1
pkgdesc="a realtime plotting utility for terminal with data input from stdin"
arch=('x86_64')
license=('Apache 2.0')
url="https://github.com/tenox7/ttyplot"
source=('git+https://github.com/tenox7/ttyplot.git')
sha256sums=('SKIP')


pkgver() {
 	cd ttyplot
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/ttyplot
	make
}

package() {
	install -D -m755 $srcdir/ttyplot/ttyplot  $pkgdir/usr/bin/ttyplot
}
