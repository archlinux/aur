# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>
_name=bce-python-sdk
pkgname=python-baidubce
pkgver=0.8.92
pkgrel=1
pkgdesc="BCE SDK for python"
url="https://pypi.org/project/${_name}"
depends=(python-pycryptodome python-future python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(Apache2)
arch=(any)
source=(https://pypi.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha512sums=('06c9e7be86b79298e87256102efd6d9581863fe2ca0a78372d7912fcf054e851f197efcfa648b2dec17d3c6e02fc3f15ccd23bfff4795466bf4836eceb8def41')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_name}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
