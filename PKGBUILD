# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname='python-ipaddr'
pkgver=2.1.11
pkgrel=1
pkgdesc="An IPv4/IPv6 manipulation library in Python. The Google Code version for Python 3.x."
arch=('any')
url="http://code.google.com/p/ipaddr-py/"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/i/ipaddr/ipaddr-${pkgver}.tar.gz")
md5sums=('f315ac829218e9735c5d772d59a3e0e7')

check() {
  cd "${srcdir}/ipaddr-${pkgver}"
  2to3 ipaddr.py ipaddr_test.py -w
  python3 ipaddr_test.py
}
md5sums=('f2c7852f95862715f92e7d089dc3f2cf')

package() {
  cd "${srcdir}/ipaddr-${pkgver}"
  python3 setup.py install --root="${pkgdir}" -O1
}
