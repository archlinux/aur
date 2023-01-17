# Maintainer: Mistle <tehmistle [at] gmx.com>
pkgname=vr2normal
pkgver=1.5
pkgrel=1
pkgdesc="C++ QT Program that converts virtual reality videos into normal videos for viewing on any screen"
arch=('x86_64')
url="https://gitlab.com/vongooB9/vr2normal"
license=('GPL3')
depends=('ffmpeg>=5.0' 'qt5-base>=5.15.0')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('8b145304b716e4abafdae1c0f9214e535b8db4b0ffbcc01df0364eb245a65f62')

build() {
	cd "$pkgname-$pkgver"
	qmake-qt5 USR_DIR=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
