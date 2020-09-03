# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=aes
pkgver=0.2.0
pkgrel=1
pkgdesc="encryption utility with very simple interface"
arch=('any')
url="https://github.com/x1b6e6/aes.git"
license=("MIT")
depends=("libgcrypt" "docopt")
makedepends=("gcc" "make" "cmake")

source=("git+${url}")

sha1sums=("SKIP")

build(){
	cd $srcdir/aes
	cmake -Bbuild -G "Unix Makefiles"
	cmake --build build --target all
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/aes/build/aes" "$pkgdir/usr/bin/aes"
}

# vim: set ts=4 sw=4 :
