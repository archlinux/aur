# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mattersend
pkgver=1.0
pkgrel=1
pkgdesc="CLI tool to send messages to the Incoming webhook of mattermost"
arch=(any)
url="https://github.com/mtorromeo/mattersend"
license=('BSD')
depends=(python-requests python-setproctitle)
makedepends=(python-setuptools)
source=(http://pypi.python.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('28a0b1f0a8936809e2b6ef34ac69d0c5bfcba5d26f3c1f857016ed95a435596b')
