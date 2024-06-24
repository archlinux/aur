# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pyhdbpp
_git_name=libhdbpp-python
pkgname=python-${_name}
pkgver=1.5.12
pkgrel=1
pkgdesc="hdb++ python3 API"
arch=('any')
url="https://gitlab.com/tango-controls/hdbpp/${_git_name}"
license=('LGPL3')
depends=(python-future python-pytango python-pyqtgraph python-pymysql python-yaml)
optdepends=('python-psycopg2: for timescaledb')
makedepends=(python-setuptools)
source=("${_git_name}-${pkgver}.tar.gz::https://gitlab.com/tango-controls/hdbpp/${_git_name}/-/archive/${pkgver}/${_git_name}-${pkgver}.tar.gz")
sha256sums=('05d13dc425cc539cb48cdb66c46bd0efd1b6df27b9ef0594076314da4ee5cefa')

build() {
  cd "${_git_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_git_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
