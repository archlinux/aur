pkgname=settings-phonepi
pkgver=1
pkgrel=2
pkgdesc="Settings application for PhonePi project"
url="https://github.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" "cmake")
depends=("qt5-base" "qt5-tools")
source=(git://github.com/PhonePi/phonepi.git)
sha256sums=("SKIP")

build() {
	cd "$srcdir/phonepi/src/settings-app"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/phonepi/src/settings-app"
	make DESTDIR=$pkgdir install
}
