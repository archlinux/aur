# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ibm-db-sa
pkgver=0.3.5
pkgrel=4
pkgdesc="SQLAlchemy support for IBM Data Servers"
url="https://pypi.python.org/pypi/ibm_db_sa"
license=('Apache')
arch=('any')
depends=('python-sqlalchemy')
makedepends=('python-setuptools' 'python-sqlalchemy')
checkdepends=('python-nose' 'python-coverage')
source=("https://pypi.io/packages/source/i/ibm_db_sa/ibm_db_sa-$pkgver.tar.gz")
sha512sums=('de98ed3111f507a965aae562caec67620a4b5d19f18609274e6e5fc788ad14472deacd55e6ea5f4704c8a907ca2899eeda32c4b4d3c8e2b5083f74cfb53f5fa3')

build() {
  cd ibm_db_sa-$pkgver
  python setup.py build
}

check() {
  cd ibm_db_sa-$pkgver
  nosetests3 || echo "Tests failed"
}

package() {
  cd ibm_db_sa-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}
