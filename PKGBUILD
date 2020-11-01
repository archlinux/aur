# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-scikit-umfpack
pkgver=0.3.2
pkgrel=1
pkgdesc="Python interface to UMFPACK sparse direct solver."
url="https://scikit-umfpack.github.io/scikit-umfpack"
depends=('suitesparse' 'python-scipy' 'cython' 'python-numpy')
makedepends=('swig' 'python-setuptools' 'python-pypandoc')
license=('BSD')
arch=('x86_64')
source=("https://github.com/scikit-umfpack/scikit-umfpack/archive/${pkgver}.tar.gz")
md5sums=('40f9cccda50df9b0a5efcd24521dae54')

build() {
  cd "scikit-umfpack-${pkgver}"
  python setup.py build
}

package() {
  cd "scikit-umfpack-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
