# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-pycapnp
_pkgname=pycapnp
pkgver=0.6.3
pkgrel=1
pkgdesc="cython wrapping of the C++ Cap'n Proto serialization library"
arch=(any)
url=https://pypi.python.org/pypi/pycapnp
license=(BSD)
depends=(python capnproto)
makedepends=(python-setuptools cython)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('5e02c9288dff8fc690866261c79eaf86')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
