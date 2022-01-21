# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-dataset
pkgver=1.5.2
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
sha256sums=('27271f3fd5cfe93ae04cf9c91f87b9a3d4d50c48ed6fda3407f9ef50b913b8bd')

build() {
  cd dataset-${pkgver}
  python setup.py build
}

package() {
  cd dataset-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
