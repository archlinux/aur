# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=aes
pkgver=0.1.0
pkgrel=1
pkgdesc="encryption utility with very simple interface"
arch=('any')
url="https://github.com/x1b6e6/aes.git"
license=("MIT")
depends=("libgcrypt" "docopt")
makedepends=("gcc" "make" "cmake")

source=(
	"CMakeLists.txt"
	"aes.cc"
)

sha1sums=(
	"4c656edb9888276841ab1849084b5beeb7221f7a"
	"6ab800f3769b1fcc393be977ba6eb32e750045cf"
)

build(){
	cd $srcdir
	cmake -Bbuild -G "Unix Makefiles"
	cmake --build build --target all
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/build/aes" "$pkgdir/usr/bin/aes"
}

# vim: set ts=4 sw=4 :
