# Maintainer: Tomasz Kramkowski <tk@the-tk.com>
pkgname=minecurses-git
pkgver=r32.dbbff0e
pkgrel=1

pkgdesc='A ncurses clone of minesweeeper written in C'
arch=('i686' 'x86_64')
url='https://github.com/EliteTK/minecurses.git'
license=('GPL2')
depends=('ncurses')
makedepends=('git')

source=('git+https://github.com/EliteTK/minecurses.git')
md5sums=('SKIP')

pkgver() {
	cd minecurses

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C minecurses
}

package() {
	make -C minecurses DESTDIR="${pkgdir}" PREFIX=/usr install
}
