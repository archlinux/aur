# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="v0.12"
pkgrel="1"
pkgdesc="Terminal based bitwise manipulator in curses"
arch=("any")
license=("GPL3")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/v0.12/bitwise-v0.12.tar.gz")
sha256sums=('7bbe597dd55dde8223383c3112301988678b50721ba572f6190f38e1cfdeb051')

build() {
    cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

