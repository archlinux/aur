# Maintainer: NexAdn <nexadn@yandex.com>
pkgname="libws2801"
pkgver=1.1.0
pkgrel=1
pkgdesc="C/C++ libaries for the ws2801 led strip using spidev"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/nexadn/libws2801"
license=("GPL")
depends=("boost-libs" "qt5-base")
makedepends=("git" "cmake" "boost")
source=("git+https://gitlab.com/nexadn/libws2801.git")
sha512sums=('SKIP')

build() {
	mkdir -p "$srcdir/libws2801/build"
	cd "$srcdir/libws2801/build"
	git checkout v${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DNOEXAMPLES=true ..
	make
}

package() {
	cd "$srcdir/libws2801/build"
	make DESTDIR="$pkgdir" install
}
