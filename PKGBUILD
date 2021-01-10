# Maintainer: Philip Johansson <philipphuket at gmail dotcom>
pkgname=console_sudoku
pkgver=2.02
pkgrel=1
epoch=
pkgdesc="Fully fledged ncurses sudoku application built entirely in C++"
arch=('x86_64')
url="https://github.com/flyingpeakock/Console_sudoku"
license=('MIT')
groups=()
depends=(ncurses git)
makedepends=(gcc)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/flyingpeakock/Console_sudoku.git")
noextract=("${source[@]##*/}")
md5sums=(SKIP)
validpgpkeys=()

build() {
	cd "$srcdir"
        g++ -O3 -pthread ./Console_sudoku/src/*.cpp -lncursesw -o console_sudoku
}

package() {
        cd "$srcdir"
        install -Dm755 console_sudoku $pkgdir/usr/bin/console_sudoku
        install -Dm644 ./Console_sudoku/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
