# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='asc'
pkgdesc='Make a single shell script from images.'
pkgver=1.1
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/asc'
license=('GPL-3.0-or-later')

depends=('libpng')
makedepends=('git')

prepare() {
	git clone --depth 1 "$url" "$srcdir"
}

build() {
	make -C "$srcdir"
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	make -C "$srcdir" install PREFIX="$pkgdir/usr"
}
