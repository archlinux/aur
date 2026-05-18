# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='quram-qtc-tool-git'
pkgdesc='A tool for bidirectional file conversion between raw data and .qtc format.'
pkgver=r34.40d3d88
pkgrel=1

arch=('x86_64')
url='https://github.com/bhmsgame06/quram-qtc-tool'
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')

depends=()
makedepends=('git')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin"
	make install PREFIX="$pkgdir/usr"
}
