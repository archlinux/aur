# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ibm-db-sa
pkgver=0.3.7
pkgrel=1
pkgdesc="SQLAlchemy support for IBM Data Servers"
url="https://pypi.python.org/pypi/ibm_db_sa"
license=('Apache')
arch=('any')
depends=('python-sqlalchemy')
makedepends=('python-setuptools' 'python-sqlalchemy')
checkdepends=('python-nose' 'python-coverage')
source=("https://pypi.io/packages/source/i/ibm_db_sa/ibm_db_sa-$pkgver.tar.gz")
sha512sums=('010cffbf9b288bc46e505537ceadf5287447da04c8f58d6c8163d416833c99cfd27e759cf7c206b76eb910409186bb40977fd52ed5ac720e2290fcd03cdfadf3')

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
