# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>
_name=bce-python-sdk
pkgname=python-baidubce
pkgver=0.9.25
pkgrel=1
pkgdesc="BCE SDK for python"
url="https://pypi.org/project/${_name}"
depends=(python-pycryptodome python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(Apache-2.0)
arch=(any)
source=(https://pypi.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz)
sha512sums=('3d737851c1a6996a54747977e91d535e05657326b44425245d4068f46a3a338d8aa9e05332a7c90b8bbd6825d635bbe360eff66adb1d802d2a485e9b1292326d')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
