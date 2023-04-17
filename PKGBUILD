# Maintainer: Mistle <tehmistle [at] gmx.com>
pkgname=vr2normal
pkgver=1.7
pkgrel=1
pkgdesc="C++ QT Program that converts virtual reality videos into normal videos for viewing on any screen"
arch=('x86_64')
url="https://gitlab.com/vongooB9/vr2normal"
license=('GPL3')
depends=('ffmpeg>=5.0' 'qt5-base>=5.15.0')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('a7befad08d7b2563d51a55609d8518d1d109079f8f215768ed139cdb8fd091cb')

build() {
	cd "$pkgname-$pkgver"
	qmake-qt5 USR_DIR=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
