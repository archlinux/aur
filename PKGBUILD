# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=hx-git
pkgver=1.0.14.r0.c124b40
pkgrel=1
pkgdesc='Hex editor for the terminal using plain C99 + POSIX libs'
arch=('x86_64')
url='https://github.com/krpors/hx'
license=('MIT')
provides=('hx')
conflicts=('hx')
source=('git+https://github.com/krpors/hx')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/hx"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd hx
	make
}

package() {
	cd hx
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
