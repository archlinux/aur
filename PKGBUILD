# Maintainer: éclairevoyant

_pkgname=tty-clock
pkgname="$_pkgname-git"
pkgver=2.3.r40.f2f847c
pkgrel=2
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
	git -C $_pkgname describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	make -C $_pkgname
}

package() {
	cd $_pkgname
	install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 $_pkgname.1 -t "$pkgdir/usr/share/doc/$_pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
