# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
pkgver=1.5.1
pkgrel=1
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-tensorflow<=1.14.0' 'python-pytest' 'python-pandas' 'python-scipy' 'python-multipledispatch')
makedepends=('python-setuptools')
source=("https://github.com/GPflow/GPflow/archive/v${pkgver}.tar.gz")
sha256sums=('ae438ecc38871b1d6812c1dec21c84c93f70887397d1b2dc4a058d46f031e346')

build() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
