# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='sfiler'
pkgdesc='File transfer: PC <-> Samsung Swift device.'
pkgver=1.0
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/sfiler'
license=('GPL-3.0-or-later')

depends=()
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
