# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pyhdbpp
pkgname=python-$_name
pkgver=1.1.2
pkgrel=1
pkgdesc="hdb++ python3 API"
arch=('any')
url='https://gitlab.com/tango-controls/hdbpp/libhdbpp-python'
license=('LGPL3')
depends=(python-future python-pytango python-pyqtgraph python-pymysql python-yaml)
optdepends=('python-psycopg2: for timescaledb')
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c81f038d53d71b04dd609bf4108510a0e6b17625fadef192f876fe49d286003c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
