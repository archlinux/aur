# Maintainer: Mistle <tehmistle [at] gmx.com>
pkgname=vr2normal
pkgver=1.4
pkgrel=1
pkgdesc="C++ QT Program that converts virtual reality videos into normal videos for viewing on any screen"
arch=('x86_64')
url="https://gitlab.com/vongooB9/vr2normal"
license=('GPL3')
depends=('ffmpeg>=5.0' 'qt5-base>=5.15.0')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('2b28bf8d3d4b39b829a15b4fcc02af76cbe58bc34eb7307dafd7c5b47f78c7c3')

build() {
	cd "$pkgname-$pkgver"
	qmake-qt5 USR_DIR=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
