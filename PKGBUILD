# Maintainer: gilcu3

_pkgname=ttyplot
pkgname=$_pkgname-git
pkgver=r446.ec32294
pkgrel=1
pkgdesc="A realtime plotting utility for terminal with data input from stdin"
arch=('x86_64')
license=('Apache 2.0')
url="https://github.com/tenox7/ttyplot"
source=('git+https://github.com/tenox7/ttyplot.git')
sha256sums=('SKIP')
depends=('ncurses')

pkgver() {
 	cd $srcdir/$_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_pkgname
	make
}

package() {
	cd $srcdir/$_pkgname
    install -Dm644 $_pkgname.1 ${pkgdir}/usr/share/man/man1/$_pkgname.1
	install -D -m755 $_pkgname  $pkgdir/usr/bin/$_pkgname
}
