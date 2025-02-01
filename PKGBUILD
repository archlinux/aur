# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pyhdbpp
_git_name=libhdbpp-python
pkgname=python-${_name}
pkgver=1.7.8
pkgrel=1
pkgdesc="hdb++ python3 API"
arch=("any")
url="https://gitlab.com/tango-controls/hdbpp/${_git_name}"
license=("LGPL3")
depends=(python-pytango python-pyqtgraph python-pymysql python-yaml)
optdepends=("python-psycopg2: for timescaledb")
makedepends=(python-setuptools)
source=("${_git_name}-${pkgver}.tar.gz::https://gitlab.com/tango-controls/hdbpp/${_git_name}/-/archive/${pkgver}/${_git_name}-${pkgver}.tar.gz")
sha256sums=("14a7933703fcb28d2054bccba9281f2202e72e5078c7af8c53593bea6777f909")

build() {
  cd "${_git_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_git_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
