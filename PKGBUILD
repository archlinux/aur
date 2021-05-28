# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yunhui Fu <yhfudev at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>

pkgname=python-pygccxml
pkgver=2.2.1
pkgrel=1
pkgdesc="Simple framework to navigate C++ declarations, using Python classes."
arch=(any)
url="https://github.com/gccxml/pygccxml"
license=(Boost)
depends=(castxml python)
makedepends=(python-setuptools)
checkdepends=(python-pycodestyle)
provides=(pygccxml)
replaces=(pygccxml)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gccxml/pygccxml/archive/v${pkgver}.tar.gz")
sha256sums=('9815a12e3bf6b83b2e9d8c88335fb3fa0e2b4067d7fbaaed09c3bf26c6206cc7')

build() {
  cd "${srcdir}/pygccxml-${pkgver}"
  python setup.py build
}

#check() {
#  cd "${srcdir}/pygccxml-${pkgver}"
#  python -m unittests.test_all
#}

package() {
  cd "${srcdir}/pygccxml-${pkgver}"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
}
