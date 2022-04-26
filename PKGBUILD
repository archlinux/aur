# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-cq_warehouse
pkgver=0.6.0
pkgrel=1
pkgdesc="A cadquery parametric part collection"
arch=(x86_64)
url="https://github.com/gumyr/cq_warehouse"
license=('Apache')
depends=(
python-cadquery
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gumyr/cq_warehouse/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3f928eebde439b3c7c161059bb8a8442cf243c4f401916e4bda6ec97099768dc')

prepare() {
  cd cq_warehouse-${pkgver}
}

build() {
  cd cq_warehouse-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd cq_warehouse-${pkgver}
  python -m unittest -v  # project currently configured incorrectly for this to work
}

package() {
  cd cq_warehouse-${pkgver}
  # python -m installer --destdir="${pkgdir}" dist/*.whl
  python -m installer --destdir="${pkgdir}" dist/cq_warehouse-${pkgver}*.whl
}

