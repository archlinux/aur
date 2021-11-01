# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="0.43"
pkgrel="1"
pkgdesc="Terminal based bitwise calculator in curses"
arch=("any")
license=("GPL3")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses" "readline")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/v0.43/bitwise-v0.43.tar.gz")
md5sums=('494eb69b2db406e921f64812d76e111d')

build() {
    cd "${pkgname}-v${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" install
}

