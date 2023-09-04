# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-dataset
pkgver=1.6.2
pkgrel=1
pkgdesc="Toolkit for Python-based database access."
url="https://github.com/pudo/dataset"
depends=(
python-alembic
python-sqlalchemy
python-banal
python)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pudo/dataset/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('74c129f38da4f2e72c2708c6abce2217ca8d7e8d5358245ff0ca441bdbec68ea')

build() {
  cd dataset-${pkgver}
  python setup.py build
}

package() {
  cd dataset-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
