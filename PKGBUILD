# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pyhdbpp
_git_name=libhdbpp-python
pkgname=python-${_name}
pkgver=1.2.0
pkgrel=1
pkgdesc="hdb++ python3 API"
arch=('any')
url="https://gitlab.com/tango-controls/hdbpp/${_git_name}"
license=('LGPL3')
depends=(python-future python-pytango python-pyqtgraph python-pymysql python-yaml)
optdepends=('python-psycopg2: for timescaledb')
makedepends=(python-setuptools)
source=("${_git_name}-${pkgver}.tar.gz::https://gitlab.com/tango-controls/hdbpp/${_git_name}/-/archive/${pkgver}/${_git_name}-${pkgver}.tar.gz")
sha256sums=('a88e595846661d9f4c0c35057b02d0b7d45fa089c82f38a4f1bcb97d0397b2d5')

build() {
  cd "${_git_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_git_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
