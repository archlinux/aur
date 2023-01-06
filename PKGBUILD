pkgname=python-tensap
pkgver=1.3
pkgrel=1
pkgdesc="A Python package for the approximation of functions and tensors"
url="https://github.com/anthony-nouy/tensap"
arch=(any)
license=('LGPL')
makedepends=('python-setuptools')
depends=('python-scipy' 'python-tensorflow')
source=("https://github.com/anthony-nouy/tensap/archive/v${pkgver}.tar.gz")
sha256sums=('49b269db4a6a6c818b9345d691f9a4aa052a1cb4bf746aec9e923bb2b9ac8794')

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


