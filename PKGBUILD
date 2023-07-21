# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="0.50"
pkgrel="1"
pkgdesc="Terminal based bitwise calculator in curses"
arch=("any")
license=("GPL3")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses" "readline")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/v0.50/bitwise-v0.50.tar.gz")
md5sums=('7ed023d309f7e30531b1c971929b2330')

build() {
    cd "${pkgname}-v${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" install
}

