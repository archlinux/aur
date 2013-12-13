# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=myremotedump
pkgver=0.1.0
pkgrel=1
pkgdesc="Dumps a firewalled MySQL database via a ssh tunnel to the remote system"
arch=(any)
url="https://github.com/mtorromeo/myremotedump"
license=('BSD')
depends=(python2 python2-paramiko python2-setproctitle)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('634bea5aea29a53440bb2720f35ca9a42901cef061dad1257936ce9e259301a8')
