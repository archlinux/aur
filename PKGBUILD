# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mattersend
pkgver=1.1
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

sha256sums=('432a9b964f415ba33698f238fd5ac8fe250b029d5622badc56f20feeca267a30')
