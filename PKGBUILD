# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>
_name=bce-python-sdk
pkgname=python-baidubce
pkgver=0.9.6
pkgrel=1
pkgdesc="BCE SDK for python"
url="https://pypi.org/project/${_name}"
depends=(python-pycryptodome python-future python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(Apache-2.0)
arch=(any)
source=(https://pypi.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha512sums=('9ef6c94286537f283835ef4bc2bf1f84f0a341838d054175b2b79fd5a797fe792e90f42be761fa48232c1a38c3f0e6228026edc91989ba8b5b5f09d556b5fa52')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_name}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
