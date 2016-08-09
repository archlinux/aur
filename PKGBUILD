# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-pulsar
_pkgname=pulsar
pkgver=1.4.0
pkgrel=1
pkgdesc='Event driven concurrent framework using asyncio'
arch=(any)
url=http://pythonhosted.org/pulsar/
license=('BSD')
depends=(python)
makedepends=(python-setuptools cython)
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/02/b6/3f741760b7ef692f6a03cdf476715239a9c21ee12a692c58e58a7c6c2484/${_pkgname}-${pkgver}.tar.gz")
md5sums=(5074e8c82765b263e86211d98febd79e)

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
