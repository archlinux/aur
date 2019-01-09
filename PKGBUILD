# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
pkgver=1.3.0
pkgrel=1
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-tensorflow' 'python-pytest' 'python-pandas' 'python-scipy' 'python-multipledispatch')
makedepends=('python-setuptools')
source=("https://github.com/GPflow/GPflow/archive/v${pkgver}.tar.gz")
sha256sums=('c3603a93de848107cbc8ef1b8e768a6ea181da37eda5ffc0f69079dbd1021ed9')

build() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
