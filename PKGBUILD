# Maintainer: graysky <graysky AT archlinux dot us>
pkgname=modprobed-db
pkgver=2.30
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
sha256sums=('b89b44f1c0911e23377c2571121a08d3a10c3410e953251a4408216e57560837')
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
