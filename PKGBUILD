# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="0.11"
pkgrel="1"
pkgdesc="Terminal based bitwise manipulator in curses"
arch=("any")
license=("Apache")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/0.11/bitwise-0.11.tar.gz")
sha256sums=('dd5658225fa407c563ee7fa65d3a6888ef071b726b745e7ebd79c4f02d7fefa1')

build() {
    cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

