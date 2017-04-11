# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python2-pycapnp
_pkgname=pycapnp
pkgver=0.5.11
pkgrel=1
pkgdesc="A cython wrapping of the C++ Cap'n Proto serialization library"
arch=(any)
url=https://pypi.python.org/pypi/pycapnp
license=(BSD)
depends=(python2 capnproto)
makedepends=(python2-setuptools cython2)
source=("https://pypi.python.org/packages/3a/3e/ace33380da38b0d02420b0697feb5c521b9d5756e6b376d20cee145a6822/${_pkgname}-${pkgver}.tar.gz")
md5sums=('68bca2c8c79e5843a11165e2ece3eebf')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
