# Maintainer: Roman Beslik <me@beroal.in.ua>

pkgname=bittorrent2player
pkgver=1.7
pkgrel=2
url=http://www.beroal.in.ua/prg/bittorrent2player/
pkgdesc="Transfers data from the BitTorrent network to another protocol (currently HTTP) which is more suitable for media players."
arch=("any")
license=("LGPL")
depends=("python2" "python2-distribute" "libtorrent-rasterbar>=0.15.7" "desktop-file-utils")
makedepends=()
backup=("etc/bittorrent2player/logging.conf")
install=_.install
source=("http://www.beroal.in.ua/prg/$pkgname/src/$pkgname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1
}

sha512sums=( \
	"21dae5ae20afab98913ca40a1c60ad2eabb119be11e4f7f2e23605e9ed3a104065ed14acb7818330ef3c1468f614d9cbb6477fbf5d44b688d89b75fae4f96200"
	)
