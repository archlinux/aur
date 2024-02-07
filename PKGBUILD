# Maintainer: Pablo Alessandro Santos Hugen <PabloASHugen@protonmail.com>
pkgname=sandbar-git
pkgver=v0.1.r3.c0737db
pkgrel=1
pkgdesc="dwm-like bar for the river wayland compositor"
arch=(x86_64)
url="https://github.com/kolunmi/sandbar"
license=('GPL3')
depends=('wayland' 'pixman' 'fcft')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("sandbar::git+https://github.com/kolunmi/sandbar.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
