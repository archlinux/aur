# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=lximage-qt
pkgver=0.4.0
pkgrel=1
pkgdesc="The LXQt image viewer"
arch=("i686" "x86_64")
groups=("lxqt")
url="http://lxqt.org"
license=("GPL2")
depends=("pcmanfm-qt")
makedepends=("cmake" "qt5-tools")
install="$pkgname.install"
source=("http://downloads.lxqt.org/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=("11abc99b0946e6254aad42cb3e29349dc6199879be0728418e7bc81200d59730")


build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
