# Maintainer: redfish <redfish@galactica.pw>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitcoinlib
pkgver=0.10.2
pkgrel=1
pkgdesc="An easy interface to the Bitcoin protocol and data structures"
arch=('any')
depends=('openssl' 'python')
makedepends=('python-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=(https://github.com/petertodd/python-bitcoinlib/archive/$pkgname-v$pkgver.tar.gz)
conflicts=('python-bitcoin' 'python-pybitcointools' 'python-bitcoinlib')
provides=("$pkgname=$pkgver")

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

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
sha256sums=('ece62f717c7e2077aefa3d7d8eed8e941b2383b8a26d035c4ee250f5474ca7a0')
