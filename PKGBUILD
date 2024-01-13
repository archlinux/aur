# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>
_name=bce-python-sdk
pkgname=python-baidubce
pkgver=0.9.2
pkgrel=1
pkgdesc="BCE SDK for python"
url="https://pypi.org/project/${_name}"
depends=(python-pycryptodome python-future python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(Apache2)
arch=(any)
source=(https://pypi.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha512sums=('87f8469f9d6f02bb76b5d70268d31af0b0afe375654d54acfd5a7b81c40e1c15c08a55e9f3041e19375ab264ed1de34f7d7168df407866080dcdecee8ffbc2ed')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_name}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
