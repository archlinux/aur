# Maintainer: EvelynMakesThings <me@evelynmakesthings.xyz>
pkgname=cubems
pkgver=r12.a710781
pkgrel=1
pkgdesc="A replacement master server for Cube (2001)"
arch=("x86_64")
depends=()
makedepends=("base-devel")
license=("GPL3")
source=("git+https://github.com/EvelynMakesThings/CubeMS.git")
sha256sums=("SKIP")
validpgpkeys=()

pkgver() {
	cd "$srcdir/CubeMS"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/CubeMS"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/CubeMS"
	make DESTDIR="$pkgdir/" install
}
