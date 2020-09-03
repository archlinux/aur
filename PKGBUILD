# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=pnghide
pkgver=0.2.3
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
	"70a9c20cace23c5b7153a7347e1288ebbbcdc80d"
	"ca18949b8ac36c196f466a052025601d670c22c1"
)

build(){
	cd $srcdir
	cmake -Bbuild -G "Unix Makefiles"
	cmake --build build --target all
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/build/pnghide" "$pkgdir/usr/bin/pnghide"
}

# vim: set ts=4 sw=4 :
