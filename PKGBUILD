# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=adol-c-git
_pkgname=adol-c
pkgver=20201112
pkgrel=1
pkgdesc="ADOL-C automatic differentiation library"
arch=("x86_64")
url="https://github.com/coin-or/ADOL-C"
license=('EPL')
depends=("colpack" "boost-libs")
provides=("adol-c")
conflicts=("adol-c")
source=("git+https://github.com/coin-or/ADOL-C")
sha1sums=("SKIP")

build() {
	cd "ADOL-C"
	./configure --prefix=/usr --libdir=/usr/lib
	make
}

check() {
	cd "ADOL-C"
	make -k check
}

package() {
	cd "ADOL-C"
	make DESTDIR="$pkgdir/" install
}
