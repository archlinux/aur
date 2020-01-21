# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname='python-ipaddr'
pkgver=2.2.0
pkgrel=1
pkgdesc="An IPv4/IPv6 manipulation library in Python. The Google Code version for Python 3.x."
arch=('any')
url="http://code.google.com/p/ipaddr-py/"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/i/ipaddr/ipaddr-${pkgver}.tar.gz")
md5sums=('f88353e40dec06410acfa075b8209b27')

check() {
  cd "${srcdir}/ipaddr-${pkgver}"
  2to3 ipaddr.py ipaddr_test.py -w
  python3 ipaddr_test.py
}

package() {
  cd "${srcdir}/ipaddr-${pkgver}"
  python3 setup.py install --root="${pkgdir}" -O1
}
