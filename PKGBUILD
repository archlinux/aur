# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-pycapnp
_pkgname=pycapnp
pkgver=0.6.4
pkgrel=1
pkgdesc="cython wrapping of the C++ Cap'n Proto serialization library"
arch=(any)
url=https://pypi.python.org/pypi/pycapnp
license=(BSD)
depends=(python capnproto)
makedepends=(python-setuptools cython)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('c6746958c2f3e25f310134da5f2fc901')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
