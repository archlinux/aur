# Maintainer: mekb https://github.com/mekb-turtle
pkgname=minesweeper-terminal-git
pkgver=r5.285fd95
pkgrel=2
pkgdesc='Terminal Minesweeper game written in C'
arch=('any')
url="https://github.com/mekb-turtle/minesweeper"
source=("minesweeper::git+${url}.git")
makedepends=('git')
sha256sums=(SKIP)
package() {
	install -Dm755 "$srcdir/minesweeper/minesweeper" "$pkgdir/usr/local/bin/minesweeper"
}
build() {
	make -C "$srcdir/minesweeper"
}
pkgver() {
	cd "$srcdir/minesweeper"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
