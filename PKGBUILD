# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>
_name=bce-python-sdk
pkgname=python-baidubce
pkgver=0.9.5
pkgrel=1
pkgdesc="BCE SDK for python"
url="https://pypi.org/project/${_name}"
depends=(python-pycryptodome python-future python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(Apache-2.0)
arch=(any)
source=(https://pypi.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha512sums=('b7f4dc5254540e13c4ad2c02dd175bbcd7365a827f4a464843df3e2d6d4d37f7c715f7ec6307f4b7155441af8df16dcd5efdf91aa6da25624b66604b2e972a1c')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_name}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
