# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="v0.41"
pkgrel="1"
pkgdesc="Terminal based bitwise calculator in curses"
arch=("any")
license=("GPL3")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses" "readline")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/v0.41/bitwise-v0.41.tar.gz")
md5sums=('62514cb4d26771eec56a54901299b09e')
build() {
    cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

