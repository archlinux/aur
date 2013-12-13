# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=xmppcat
pkgver=0.1.1
pkgrel=1
pkgdesc="A unix command line program that works like cat but sends its output through XMPP"
arch=(any)
url="https://github.com/mtorromeo/xmppcat"
license=('BSD')
depends=(python-sleekxmpp python-setproctitle)
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

sha256sums=('fda64db8b86e831c8c07fef92473a784868d54dab704b5f9252df6edfa88a8a0')
