# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
pkgver=1.5.0
pkgrel=1
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-tensorflow' 'python-pytest' 'python-pandas' 'python-scipy' 'python-multipledispatch')
makedepends=('python-setuptools')
source=("https://github.com/GPflow/GPflow/archive/v${pkgver}.tar.gz")
sha256sums=('aaffa540aea0f8520f4bf2b2f5b294943e9d9fa655cb9a7986ff58306fe0c135')

build() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
