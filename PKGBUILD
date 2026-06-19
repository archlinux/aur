# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pyhdbpp
_git_name=libhdbpp-python
pkgname=python-${_name}
pkgver=2.1.0
pkgrel=1
pkgdesc="hdb++ python3 API"
arch=("any")
url="https://gitlab.com/tango-controls/hdbpp/${_git_name}"
license=("LGPL-3.0-or-later")
depends=(python-pytango python-pyqtgraph python-pymysql python-yaml)
optdepends=("python-psycopg2: for timescaledb")
makedepends=(python-setuptools)
source=("${_git_name}-${pkgver}.tar.gz::https://gitlab.com/tango-controls/hdbpp/${_git_name}/-/archive/${pkgver}/${_git_name}-${pkgver}.tar.gz")
sha256sums=("5eeec6dbc443599ff12bfe68b3ca9059095d76a401a78daa9167bfaaa48dd5e7")

build() {
  cd "${_git_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_git_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
