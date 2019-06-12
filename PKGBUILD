pkgname="buici-clock"
pkgver="0.4.9.4"
pkgrel=2
pkgdesc="A minimalistic clock for X"
arch=("x86_64" "i686")
license=("GPL v2")

depends=('xorg-server-devel' 'xorg-xprop')
makedepends=("m4")

source=(
	"http://http.debian.net/debian/pool/main/b/buici-clock/buici-clock_0.4.9.4.tar.xz"
)
sha256sums=(
	"f5138d220568e3ba5afd272c61a63e5a1a0009a6023387d2a0cbf15af9b3649f"
)

build() {
	cd "$srcdir/buici"
	./configure --prefix=/usr
#	make _version.h
	make #-j8
}

package() {
	cd "$srcdir/buici"
	make DESTDIR="$pkgdir/" install
}
