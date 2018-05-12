pkgname=python-gpflow
pkgver=1.1.1
pkgrel=1
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-tensorflow' 'python-pytest' 'python-pandas' 'python-scipy' 'python-multipledispatch')
makedepends=('python-setuptools')
source=("https://github.com/GPflow/GPflow/archive/${pkgver}.tar.gz")
md5sums=('ca8f27066573bc4fc8327abf6e9ade00')

build() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/GPflow-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
