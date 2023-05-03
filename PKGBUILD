# Maintainer: éclairevoyant

_pkgname=tty-clock
pkgname="$_pkgname-git"
pkgver=2.3.r40.f2f847c
pkgrel=1
epoch=1
pkgdesc="Analog clock in ncurses"
arch=(i686 x86_64)
url="https://github.com/xorg62/$_pkgname"
license=(BSD)
depends=(glibc ncurses)
makedepends=(git)
source=("git+$url.git")
b2sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
	cd $_pkgname
	git describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	make
}

package() {
	cd $_pkgname
	install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 $_pkgname.1 -t "$pkgdir/usr/share/doc/$_pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
