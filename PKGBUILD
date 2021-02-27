# Maintainer:
pkgname=libcrafter-git
pkgver=1.0
pkgrel=1
pkgdesc="Libcrafter is a high level library for C++ designed to create and decode network packets"
arch=(x86_64)
url="https://github.com/pellegre/libcrafter"
license=('BSD')
makedepends=(git make autoconf gcc)
source=("git+$url")
md5sums=('SKIP')

build() {
	ls
	cd "$pkgname/libcrafter"
	ls
	./autogen.sh
	make
}


package() {
	cd "$pkgname/libcrafter"
	make DESTDIR="$pkgdir" install
	ldconfig -n "$pkgdir"
}
