# Maintainer: graysky <graysky AT archlinux dot us>
pkgname=modprobed-db
pkgver=2.37
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
sha256sums=('4dc59d3208016d6c5c49c5ea430bec9f67ab1b74d162fbd6b8f3f02c878121f2')
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
