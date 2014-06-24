# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-stomp.py
pkgver=4.0.12
pkgrel=1
pkgdesc="Python STOMP client, supporting versions 1.0 and 1.1 of the protocol"
arch=(any)
url="http://code.google.com/p/stomppy"
license=(Apache 2.0)
depends=(python)
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/s/stomp.py/stomp.py-$pkgver.tar.gz")

build() {
    cd "$srcdir/stomp.py-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/stomp.py-$pkgver"
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('ce2a2293054600b4a1456e44828e60da29afa198bfa8fd85b9de74dfaef4231a')
