#Maintainer: oshaboy <noamgilor{at}protonmail{dot}com>

pkgname=tinybasic
pkgver=1
pkgrel=1
pkgdesc="Tom Pitmann's TinyBasic Interpreter written in C"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="www.ittybittycomputers.com"
license=('custom')
depends=(glibc)
optdepends=()
makedepends=(gcc)
source=("http://www.ittybittycomputers.com/IttyBitty/TinyBasic/TinyBasic.c")
sha256sums=('ab42de60f46a1617a6abd4797b52af624bfa9f255aacc72d9bf97bfa0e5541c8')
build() {
	gcc -o "${srcdir}/tinybasic" TinyBasic.c
	echo "TinyBasic interpreter Copyright 1976 Itty Bitty Computers, used by permission." >| ${srcdir}/LICENSE
}
package(){
	install -Dm755 ${srcdir}/tinybasic ${pkgdir}/usr/bin/tinybasic
	
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/tinybasic/LICENSE"
}
