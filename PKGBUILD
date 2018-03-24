# Maintainer: vimacs <https://vimacs.lcpu.club>

pkgname=mrustc-git
pkgver=0.0.3012
pkgrel=1
pkgdesc='Alternative rust compiler written in C++'
arch=('x86_64')
url='https://github.com/thepowersgang/mrustc'
license=('MIT')
depends=()
makedepends=()
provides=()
conflicts=()
source=('git+https://github.com/thepowersgang/mrustc.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/mrustc"
	echo 0.0.$(git rev-list --count HEAD)
}

build() {
	cd "$srcdir/mrustc"
	make
}

package() {
	cd "$srcdir/mrustc"
	install -D bin/mrustc "$pkgdir/usr/bin/mrustc"
}
