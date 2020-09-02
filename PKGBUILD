# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=aes
pkgver=0.1.1
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
	"bbd6a785cd0c62baf7de7e6dcb9cd970678515fe"
	"10c4f9d10e133a1c2c13b91108e472c2e0da3287"
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
