# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='ramdump-49xx'
pkgdesc='A tool for dumping RAM from Samsung Swift devices running on the PNX49xx chipset.'
pkgver=1.0
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/ramdump-49xx'
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
