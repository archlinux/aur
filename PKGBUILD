# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python2-pycapnp
_pkgname=pycapnp
pkgver=0.6.3
pkgrel=1
pkgdesc="cython wrapping of the C++ Cap'n Proto serialization library"
arch=(any)
url=https://pypi.python.org/pypi/pycapnp
license=(BSD)
depends=(python2 capnproto)
makedepends=(python2-setuptools cython2)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('5e02c9288dff8fc690866261c79eaf86')

build() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
