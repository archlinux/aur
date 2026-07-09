# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=girder-client
_name=girder_client
pkgname=python-girder-client
pkgver=5.0.12
pkgrel=1
pkgdesc='Python client for interacting with Girder servers'
arch=('any')
url='https://pypi.org/project/girder-client'
license=('Apache-2.0')
depends=(
  python-click
  python-diskcache
  python-requests
  python-requests-toolbelt
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_name}-${pkgver}.tar.gz")
sha512sums=('92e2f38ef4a8e868b3584a0f58d131fe8622f19f7c31cf579f471ac5da699f31205b17d0ed53d39e8415bae57e9fe948b53292ac0285262663f6ec5279d752b5')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
