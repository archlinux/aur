# Maintainer: Roman Beslik <me@beroal.in.ua>

pkgname=bittorrent2player
pkgver=1.5
pkgrel=1
url=("http://www.beroal.in.ua/prg/bittorrent2player/")
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
	"c6a79ef8229e23beb20d74ca29d2ef12fa01a15fb6fba20a6b41551f56360df6eb3359c9ae368580f39da82f1418a818acc5da03b6ee3c0d224050df2c9522b1"
	)
