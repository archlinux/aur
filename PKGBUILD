# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>
_name=bce-python-sdk
pkgname=python-baidubce
pkgver=0.9.41
pkgrel=1
pkgdesc="BCE SDK for python"
url="https://pypi.org/project/${_name}"
depends=(python-pycryptodome python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(Apache-2.0)
arch=(any)
source=(https://pypi.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz)
sha512sums=('eec2bf9ffeaa5beb51fdee02a0a83ba501718c85445e65ff27f7273d5219da76c6a67feba8910af39d7ffee1caf99f300db951d9ea58e7433bbcf08fee162e64')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
