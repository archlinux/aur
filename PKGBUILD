# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-aiowsgi
_pkgname=aiowsgi
pkgver=0.3
pkgrel=1
pkgdesc='A minimalist wsgi server using asyncio'
arch=(any)
url=https://aiowsgi.readthedocs.org/
license=('MIT')
depends=(python-waitress)
makedepends=(python-setuptools unzip)
source=(https://pypi.python.org/packages/source/a/aiowsgi/${_pkgname}-${pkgver}.zip)
md5sums=(b36b928aec86a9af151edaf1b0645c90)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
