# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>
_name=bce-python-sdk
pkgname=python-baidubce
pkgver=0.8.79
pkgrel=1
pkgdesc="BCE SDK for python"
url="https://pypi.org/project/${_name}"
depends=(python-pycryptodome python-future python-six)
makedepends=(python-setuptools)
license=(Apache2)
arch=(any)
source=(https://pypi.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha512sums=('7e1ac2ff05d82f35032fbc0310488b86b88715a8cf2015aec3f65406edeeddd85478039b6ee8750375e1316c347c75a7cd5109e73563ed8dc4ba1131ffd0e612')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
