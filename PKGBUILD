# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ibm-db-sa
pkgver=0.3.8
pkgrel=1
pkgdesc="SQLAlchemy support for IBM Data Servers"
url="https://pypi.python.org/pypi/ibm_db_sa"
license=('Apache')
arch=('any')
depends=('python-sqlalchemy')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-coverage')
source=("https://pypi.io/packages/source/i/ibm_db_sa/ibm_db_sa-$pkgver.tar.gz")
sha512sums=('4d5bf9153eb1a3bac299fc84570a9a05253e405bfe62b4fbf31b2589a1d5720bb835cd5002ca331d01ec4edcba50f077b4755f898b9308e674984eb4dd561ef5')

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
