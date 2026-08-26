# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="0.60"
pkgrel="1"
pkgdesc="Terminal based bitwise calculator in curses"
arch=("any")
license=("GPL3")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses" "readline")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/v0.60/bitwise-v0.60.tar.gz")
md5sums=('cf8b1606b92ab43469025236c50fc5e8')

build() {
    cd "${pkgname}-v${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" install
}

