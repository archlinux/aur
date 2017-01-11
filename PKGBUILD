# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mattersend
pkgver=2.0
pkgrel=2
pkgdesc="Library and CLI utility to send messages to mattermost's incoming webhooks"
arch=(any)
url="https://github.com/mtorromeo/mattersend"
license=('BSD')
depends=(python-requests python-setproctitle)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('fd141b837ab528707490d258e2392ba1a3f117135fb2480339d952af3febfeca')
