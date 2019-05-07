# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="v0.13"
pkgrel="1"
pkgdesc="Terminal based bitwise manipulator in curses"
arch=("any")
license=("GPL3")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/v0.13/bitwise-v0.13.tar.gz")
sha256sums=('9860a0da7dc2f7b33cd0ac003d6d642b5ecd531ed68463406ca40b82ce7e5488')

build() {
    cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

