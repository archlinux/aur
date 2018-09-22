# Maintainer: Beej <beej@beej.us>

pkgname=screengrab
pkgver=1.99
pkgrel=1
pkgdesc="Crossplatform tool for grabbing screenshots of your desktop."
arch=("i686" "x86_64")
url="https://github.com/lxqt/screengrab"
license=("GPL2")
depends=("qt5-base" "qt5-x11extras" "kwindowsystem" "libqtxdg-git" "libx11" "libxcb" "hicolor-icon-theme")
makedepends=("cmake" "qt5-tools")
source=(
	"https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha256sums=(
	"e3ff978123f79fbf0bf212b903b605c1e71d00330d61bfc4eebb4797bacec89f"
)


build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
