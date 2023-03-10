# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pyhdbpp
_git_name=libhdbpp-python
pkgname=python-$_name
pkgver=1.1.3
pkgrel=1
pkgdesc="hdb++ python3 API"
arch=('any')
url='https://gitlab.com/tango-controls/hdbpp/libhdbpp-python'
license=('LGPL3')
depends=(python-future python-pytango python-pyqtgraph python-pymysql python-yaml)
optdepends=('python-psycopg2: for timescaledb')
makedepends=(python-setuptools)
source=("$_git_name-$pkgver.tar.gz::https://gitlab.com/tango-controls/hdbpp/${_git_name}/-/archive/${pkgver}/${_git_name}-${pkgver}.tar.gz")
sha256sums=('f562dcdbedaaef90c7e35ed6dbe8179e759202cadac70611f2ec3d8d16d7a37f')

build() {
  cd "$_git_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_git_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
