# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=pnghide
pkgver=0.2.2
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
	"e17604fafe5a99a5921e8b76cf1d86f8b1a54fa8"
	"b6cc8f102b1f9b433c99e3e279482e04bc7d3f9a"
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
