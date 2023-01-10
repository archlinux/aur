pkgname=python-tensap
pkgver=1.4
pkgrel=1
pkgdesc="A Python package for the approximation of functions and tensors"
url="https://github.com/anthony-nouy/tensap"
arch=(any)
license=('LGPL')
makedepends=('python-setuptools')
depends=('python-scipy' 'python-tensorflow')
source=("https://github.com/anthony-nouy/tensap/archive/v${pkgver}.tar.gz")
sha256sums=('ae1e47455043a8ac771839e333be62228dbfdb00944465ff3675ca2b114fd0fd')

prepare() {
  cd "${srcdir}"/tensap-$pkgver
}

build() {
  cd "${srcdir}"/tensap-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/tensap-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


