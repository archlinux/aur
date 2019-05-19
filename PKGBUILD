# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="v0.14"
pkgrel="1"
pkgdesc="Terminal based bitwise manipulator in curses"
arch=("any")
license=("GPL3")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/v0.14/bitwise-v0.14.tar.gz")
md5sums=('81a2c44bd7ee04a6947de1579535a729')

build() {
    cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

