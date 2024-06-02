# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yunhui Fu <yhfudev at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>

pkgname=python-pygccxml
pkgver=2.5.0
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
sha256sums=('ac6b15f17c4640b0d5dce3a0b903e7c7d0a66c6a5ebf3cff1cd263998bd55c9d')

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
