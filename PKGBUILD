# Maintainer: Ashton Grimes <amgrimes2002@gmail.com>

pkgname=tuiser-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux TUI serial monitor"
arch=(any)
url="https://github.com/AshtonGrimes/tuiser"
license=(GPL-3.0-or-later)
depends=(ncurses)
makedepends=(gcc git)
source=("git+https://github.com/AshtonGrimes/tuiser")
sha256sums=(SKIP)

package() {
	cd tuiser
	gcc -v -O0 -lm -lncurses tuiser.c -o tuiser
	install -Dm755 tuiser -T "$pkgdir/usr/bin/tuiser"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
