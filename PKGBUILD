# Maintainer: Ramon Fried <rfried.dev@gmail.com>
pkgname="bitwise"
pkgver="0.1"
pkgrel="1"
pkgdesc="Terminal based bitwise manipulator in curses"
arch=("any")
license=("Apache")
url="https://github.com/mellowcandle/bitwise"
depends=("ncurses")
provides=("bitwise")

source=("https://github.com/mellowcandle/bitwise/releases/download/0.1/bitwise-0.1.tar.gz")
sha256sums=('42b7b58d3138fe3851ad71800ba73e488715dc0fb234880f9415ad76ed82c5b0')

build() {
    cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

