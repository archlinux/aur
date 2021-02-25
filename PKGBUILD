pkgname=python-basictools
pkgver=1.5
pkgrel=1
pkgdesc="Safran FE helper tools"
arch=('x86_64')
url="https://gitlab.com/DRTI/basic-tools"
license=('BSD')
depends=('python-pyparsing' 'python-sympy' 'python-scipy')
makedepends=('python-setuptools' 'cython' 'eigen')
source=("https://gitlab.com/DRTI/basic-tools/-/archive/v${pkgver}/basic-tools-v${pkgver}.tar.bz2")
sha256sums=('6a51099667287fce53e1def5c4128cd7652535f9ac264153476ffd22111d31fa')

prepare() {
  cd "$srcdir/basic-tools-v$pkgver"
}

package() {
  cd "$srcdir/basic-tools-v$pkgver"
  BASICTOOLS_DISABLE_MKL=1 BASICTOOLS_DISABLE_OPENMP=1 EIGEN_INC="/usr/include/eigen3" python setup.py install --root="${pkgdir}" --optimize=1
}

