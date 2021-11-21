# Maintainer: Aline Abler <alinea@riseup.net>
pkgname=beyond-the-tesseract
pkgver=1.0.0
pkgrel=1
pkgdesc="A text adventure game about math."
arch=('x86_64')
url="https://ifdb.org/viewgame?id=0u4eqnk37mohejhu"
license=('unknown')
groups=()
depends=("glibc")
makedepends=("cmake" "gcc")
install=
source=("https://ifarchive.org/if-archive/games/source/tess.tar.gz")
sha256sums=('adec4a1db623e01268afef7a977cdd6eb2aa47f4faac3af21fff94c3567ad48a')
validpgpkeys=()

prepare() {
	cd "tess"
	patch -p1 -i patches01
	patch -p0 -i patches02
}

build() {
	cd "tess"
	make
}

package() {
	cd "tess"
    mkdir -p "$pkgdir/usr/bin/"
    install -Dm755 "tess" "$pkgdir/usr/bin/"
}
