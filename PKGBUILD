#Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='ramdump-49xx-git'
pkgdesc='A tool for dumping RAM from Samsung Swift devices running on the PNX49xx chipset.'
pkgver=r15.2a94af2
pkgrel=1

arch=('x86_64')
url='https://github.com/bhmsgame06/ramdump-49xx'
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
