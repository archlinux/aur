# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('python-pysnmp')
pkgver=4.4.4
pkgrel=1
pkgdesc="Pure Python, open source and free implementation of v1/v2c/v3 SNMP engine"
arch=('any')
url="https://github.com/etingof/pysnmp"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("git+https://github.com/etingof/pysnmp/#tag=v$pkgver")
sha256sums=('SKIP')

package_python-pysnmp() {
  depends=(python python-pysmi python-pyasn1)
  replaces=(pysnmp)
  cd "$srcdir/pysnmp"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pysnmp() {
  depends=(python2 python2-pysmi python2-pyasn1)
  cd "$srcdir/pysnmp"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

