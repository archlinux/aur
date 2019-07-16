# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="v0.32"
pkgrel="1"
pkgdesc="Terminal based bitwise calculator in curses"
arch=("any")
license=("GPL3")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses" "readline")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/v0.32/bitwise-v0.32.tar.gz")
md5sums=('a722e53685e102e85948b102583e93fa')

build() {
    cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

