# Maintainer: graysky <graysky AT archlinux dot us>
pkgname=modprobed-db
pkgver=2.34
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
sha256sums=('13ae2176bcf5e36dc272e98bf04571aee81f9dd3cfd4a089c46419e6f94b745f')
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
