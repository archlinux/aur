# Maintainer: graysky <graysky AT archlinux dot us>
pkgname=modprobed-db
pkgver=2.29
pkgrel=1
pkgdesc='Keeps track of EVERY kernel module ever used - useful for those of us who make localmodconfig :)'
arch=('any')
license=('MIT')
depends=('kmod')
optdepends=('sudo')
replaces=('modprobed_db')
conflicts=('modprobed_db')
url="https://wiki.archlinux.org/index.php/Modprobed-db"
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('707afa063fd78c60a0585906294493e8658054dbcd933d175be78b2945cc1354')
install=readme.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
