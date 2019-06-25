# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
pkgver=1.4.1
pkgrel=1
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-tensorflow' 'python-pytest' 'python-pandas' 'python-scipy' 'python-multipledispatch')
makedepends=('python-setuptools')
source=("https://github.com/GPflow/GPflow/archive/v${pkgver}.tar.gz")
sha256sums=('07e7f96d663aa3ad380c49a0964c1764e0e6969564d52a47077e83604d92af91')

build() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
