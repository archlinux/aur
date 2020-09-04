# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgbase=pnghide
pkgname=pnghide
pkgver=0.2.3
pkgrel=1
pkgdesc="hide plain text in png file inside pixels (unvisible changes)."
url="https://github.com/x1b6e6/pnghide"
license=("MIT")
arch=('any')
depends=("libpng" "docopt")
makedepends=("gcc" "make" "cmake" "png++")
optdepends=("aes: for encryping data")

source=("${pkgname}-${pkgver}.zip::${url}/archive/${pkgver}.zip")

sha1sums=("2edefa7cbc0422d7b024d06c17d552a748cc7773")

build(){
	cd $srcdir/${pkgname}-${pkgver}
	cmake -Bbuild -G "Unix Makefiles"
	cmake --build build --target all
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/${pkgname}-${pkgver}/build/pnghide" "$pkgdir/usr/bin/pnghide"
}

# vim: set ts=4 sw=4 :
