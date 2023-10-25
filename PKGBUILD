# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ibm-db-sa
pkgver=0.4.0
pkgrel=1
pkgdesc="SQLAlchemy support for IBM Data Servers"
url="https://pypi.python.org/pypi/ibm_db_sa"
license=('Apache')
arch=('any')
depends=('python-sqlalchemy')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-coverage')
source=("https://pypi.io/packages/source/i/ibm_db_sa/ibm_db_sa-$pkgver.tar.gz")
sha512sums=('ddb41175b4ad34d01b32f455c36ce0cced797d2692b3398031e9d31f44d3174b81a932674fe7a69d62d6a35c0f9beb6b1b23005b49dd32fe9c2f5d3d96ca324e')

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
