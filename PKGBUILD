# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yunhui Fu <yhfudev at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>

pkgname=python-pygccxml
pkgver=2.4.0
pkgrel=1
pkgdesc="Simple framework to navigate C++ declarations, using Python classes."
arch=(any)
url="https://github.com/gccxml/pygccxml"
license=(Boost)
depends=(castxml python)
makedepends=(python-build python-wheel python-installer python-setuptools)
#checkdepends=(python-pycodestyle)
provides=(pygccxml)
replaces=(pygccxml)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gccxml/pygccxml/archive/v${pkgver}.tar.gz")
sha256sums=('d59867809f8008ec48a5567a7203bb4c130ff203a8ddd708c945690749723c70')

build() {
  cd "${srcdir}/pygccxml-${pkgver}"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "${srcdir}/pygccxml-${pkgver}"
#  python -m unittests.test_all
#}

package() {
  cd "${srcdir}/pygccxml-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
