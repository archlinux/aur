# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=pnghide
pkgver=0.2.0
pkgrel=1
pkgdesc="hide plain text in png file inside pixels (unvisible changes)."
url="https://github.com/x1b6e6/pnghide.git"
license=("MIT")
arch=('any')
depends=("libpng" "docopt")
makedepends=("gcc" "make" "cmake" "png++")
optdepends=("aes: for encryping data")

source=(
	"CMakeLists.txt"
	"pnghide.cc"
)

sha1sums=(
	"4768699600d6dd28b5517fa0d16ee116eb94d9fa"
	"ce56ac86e895d5372d2b2202cfd94250254cc5a6"
)

build(){
	cd $srcdir
	cmake -Bbuild -G "Unix Makefiles"
	cmake --build build --target all -- -j2
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/build/pnghide" "$pkgdir/usr/bin/pnghide"
	install -Dm755 "$srcdir/build/pngunhide" "$pkgdir/usr/bin/pngunhide"
}

# vim: set ts=4 sw=4 :
