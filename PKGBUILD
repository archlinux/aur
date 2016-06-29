# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tinydb
pkgver=3.2.1
pkgrel=1
pkgdesc="Lightweight document oriented database optimized for your happiness"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'unzip')
url="https://github.com/msiemens/tinydb"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/6c/2e/0df79439cf5cb3c6acfc9fb87e12d9a0ff45d3c573558079b09c72b64ced/tinydb-3.2.1.zip)
md5sums=('af85819eb2589bbca9b04b8fed196e36')
sha256sums=('7fc5bfc2439a0b379bd60638b517b52bcbf70220195b3f3245663cb8ad9dbcf0')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg2 'Cleaning up pkgdir...'
  rm -rf "$pkgdir/usr/lib/python3.5/site-packages/tests"
}
