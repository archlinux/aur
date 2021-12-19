# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=neo-matrix
pkgver=0.6
_commit=0545f81f410faa7b68c6eff5ecde33c226b21e9e
pkgrel=1
pkgdesc='Simulates the digital rain from "The Matrix"'
arch=(x86_64)
url=https://github.com/st3w/neo
license=(GPL3)
depends=(ncurses)
makedepends=(git)
optdepends=(ttf-hanazono)
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=(SKIP)

prepare() {
	cd "$pkgname"
	./autogen.sh
}

build() {
	cd "$pkgname"
	./configure
	make
}

package() {
	cd "$pkgname"
	install -Dm755 "src/neo" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "doc/neo.6" "$pkgdir/usr/share/man/man6/$pkgname.6"
}
