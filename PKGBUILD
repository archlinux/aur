# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=neo-matrix
pkgver=0.6.1
_commit=662445b45153d245df02cf1516dce81175a9183d
pkgrel=2
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
	./configure --program-suffix='-matrix' --prefix="$pkgdir/usr"
	make
}

package() {
	cd "$pkgname"
	make install
}
