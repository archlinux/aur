# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pyhdbpp
_git_name=libhdbpp-python
pkgname=python-$_name
pkgver=1.1.5
pkgrel=1
pkgdesc="hdb++ python3 API"
arch=('any')
url='https://gitlab.com/tango-controls/hdbpp/libhdbpp-python'
license=('LGPL3')
depends=(python-future python-pytango python-pyqtgraph python-pymysql python-yaml)
optdepends=('python-psycopg2: for timescaledb')
makedepends=(python-setuptools)
source=("$_git_name-$pkgver.tar.gz::https://gitlab.com/tango-controls/hdbpp/${_git_name}/-/archive/${pkgver}/${_git_name}-${pkgver}.tar.gz")
sha256sums=('4efccaa18ee9de224aba08ccc978375c22fddde328b10f01bcbb360bd8714e61')

build() {
  cd "$_git_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_git_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
