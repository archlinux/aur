# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitcoinlib
pkgver=0.10.1
pkgrel=1
pkgdesc="An easy interface to the Bitcoin protocol and data structures"
arch=('any')
depends=('openssl' 'python')
makedepends=('python-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=(https://github.com/petertodd/python-bitcoinlib/archive/$pkgname-v$pkgver.tar.gz)
sha256sums=('6b0688a8c3d4ef4385f269a6ac9163a40a5eab04e3b13114891d76f87c6926dd')
conflicts=('python-bitcoin' 'python-pybitcointools' 'python-bitcoinlib')
provides=("python-python-bitcoinlib=$pkgver")

build() {
  cd "$pkgname-$pkgname-v$pkgver"

  python setup.py build
}

check() {
  cd "$pkgname-$pkgname-v$pkgver"
  python setup.py test
}

package() {
  cd "$pkgname-$pkgname-v$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
