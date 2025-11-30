# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pyhdbpp
_git_name=libhdbpp-python
pkgname=python-${_name}
pkgver=1.8.3
pkgrel=1
pkgdesc="hdb++ python3 API"
arch=("any")
url="https://gitlab.com/tango-controls/hdbpp/${_git_name}"
license=("LGPL-3.0-or-later")
depends=(python-pytango python-pyqtgraph python-pymysql python-yaml)
optdepends=("python-psycopg2: for timescaledb")
makedepends=(python-setuptools)
source=("${_git_name}-${pkgver}.tar.gz::https://gitlab.com/tango-controls/hdbpp/${_git_name}/-/archive/${pkgver}/${_git_name}-${pkgver}.tar.gz")
sha256sums=("06128ebcfae9f3ff20d09418199f3f8ae9ded0d004085685372470fee3c41987")

build() {
  cd "${_git_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_git_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
