# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yunhui Fu <yhfudev at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: zarra <zarraxx@gmail.com>

pkgname=python-pygccxml
pkgver=1.9.1
pkgrel=2
pkgdesc="Simple framework to navigate C++ declarations, using Python classes."
arch=(any)
url="https://github.com/gccxml/pygccxml"
license=(Boost)
depends=(castxml python)
makedepends=(python-setuptools)
#checkdepends=(python-pycodestyle)
provides=(pygccxml)
replaces=(pygccxml)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gccxml/pygccxml/archive/v${pkgver}.tar.gz")
sha256sums=('2fb4e18f7a3ae039a05230ca58f11e1fc925c8643f926a1be481bb4338414a95')

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
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
