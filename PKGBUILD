# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-pulsar
_pkgname=pulsar
pkgver=1.0.0
pkgrel=1
pkgdesc='Event driven concurrent framework using asyncio'
arch=(any)
url=http://pythonhosted.org/pulsar/
license=('BSD')
depends=(python)
makedepends=(python-setuptools cython)
source=(https://pypi.python.org/packages/source/p/pulsar/${_pkgname}-${pkgver}.tar.gz)
md5sums=(7dae2538589c574fe74ab6006c88afc7)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
