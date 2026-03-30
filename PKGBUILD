# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='imaster-image-tool'
pkgdesc='A tool for bidirectional file conversion between PNG (.png) and IM (.ifg) formats.'
pkgver=1.0
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/Imaster-image-tool'
license=('GPL-3.0-or-later')

depends=()
makedepends=('git' 'libpng')

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
