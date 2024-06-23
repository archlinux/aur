# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=candlelang-git
pkgver=git
pkgrel=1
pkgdesc="The latest git vcersion of Candlelang"
arch=("x86_64")
url="https://github.com/aureumapes/candle"
license=('MIT')
conflicts=('candle')
makedepends=('git' 'go>=1.21')
sha256sums=('SKIP')
validpgpkeys=()

build() {
	git clone https://github.com/aureumapes/candle.git $srcdir/${pkgname%-git}
	cd "$srcdir/${pkgname%-git}"
	go build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -vDm777 -t "$pkgdir/usr/bin" candle
}
