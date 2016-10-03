# Maintainer: graysky <graysky AT archlinux dot us>
pkgname=modprobed-db
pkgver=2.35
pkgrel=1
pkgdesc='Keeps track of EVERY kernel module ever used - useful for those of us who make localmodconfig :)'
arch=('any')
license=('MIT')
depends=('kmod')
optdepends=('sudo: needed to recall modules via a call to modprobe')
replaces=('modprobed_db')
conflicts=('modprobed_db')
url="https://wiki.archlinux.org/index.php/Modprobed-db"
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('f7e92b5437c8e5208693bc96e1b665957aa644f7828e027c93fbb1be3ed479f2')
install=readme.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
