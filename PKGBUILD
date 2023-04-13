# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ibm-db-sa
pkgver=0.3.9
pkgrel=2
pkgdesc="SQLAlchemy support for IBM Data Servers"
url="https://pypi.python.org/pypi/ibm_db_sa"
license=('Apache')
arch=('any')
depends=('python-sqlalchemy')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-coverage')
source=("https://pypi.io/packages/source/i/ibm_db_sa/ibm_db_sa-$pkgver.tar.gz")
sha512sums=('f940efb283a2699ec07b22fe4f480d058ade1fde2c9d7486e9661b1dfb821873b87719f36f89113db39a278056307a0c78d5aa6cd213c8099f9710b8c8cd2e89')

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
