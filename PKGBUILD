# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-aiowsgi
_pkgname=aiowsgi
pkgver=0.5
pkgrel=1
pkgdesc='A minimalist wsgi server using asyncio'
arch=(any)
url=https://aiowsgi.readthedocs.org/
license=('MIT')
depends=(python-webob python-waitress)
makedepends=(python-setuptools unzip)
source=(https://pypi.python.org/packages/source/a/aiowsgi/${_pkgname}-${pkgver}.zip)
md5sums=(644be06095f4c86035af7586c271ce9f)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
