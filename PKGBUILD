# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="v0.20"
pkgrel="1"
pkgdesc="Terminal based bitwise calculator in curses"
arch=("any")
license=("GPL3")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses" "readline")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/v0.20/bitwise-v0.20.tar.gz")
md5sums=('d6828a23002ffb15c75fe8f010a9c4f2')

build() {
    cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

