# Maintainer: eNV25 <env252525@gmail.com>

pkgname=tetris
pkgver=7.0.0
pkgrel=1
pkgdesc="Port of OpenBSD tetris for Linux."
arch=(x86_64)
url="https://github.com/eNV25/tetris"
license=('BSD')
depends=('ncurses' 'libbsd')
makedepends=('libbsd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
sha256sums=('13bd0201a5324e0a5f1b91b6be2c98e3789ef10fdd296a9cdb05f79134d797a9')
