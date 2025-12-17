# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>
_name=bce-python-sdk
pkgname=python-baidubce
pkgver=0.9.56
pkgrel=1
pkgdesc="BCE SDK for python"
url="https://pypi.org/project/${_name}"
depends=(python-pycryptodome python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(Apache-2.0)
arch=(any)
source=(https://pypi.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz)
sha512sums=('3e38f3369ee13f2ac4eef4f3f4d2993935bf44758387fcccd38a67a2cbf16a08dc6d11f40ee023d94044da363ffa13d53415f3b04f093f96167136b6558d2fee')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
