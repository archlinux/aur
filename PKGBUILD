# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=steamctrl-git
pkgver=10
pkgrel=1
pkgdesc="Utility to setup Valve Steam Controller"
url="https://github.com/rodrigorc/steamctrl"
license=(GPL2)
source=("git+https://github.com/rodrigorc/steamctrl")
md5sums=('SKIP')
arch=('x86_64')
depends=('udev')

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	./configure --prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir"
}

pkgver() {
	cd "$srcdir/$pkgname"
	git rev-list --count HEAD
}
