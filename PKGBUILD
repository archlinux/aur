pkgname=python-ppft
pkgver=1.6.4.9
pkgrel=1
pkgdesc="distributed and parallel python"
url="http://trac.mystic.cacr.caltech.edu/project/pathos/wiki.html"
arch=(any)
license=('BSD')
makedepends=('python-setuptools')
depends=('python-six' 'python-dill')
source=("https://github.com/uqfoundation/ppft/releases/download/ppft-${pkgver}/ppft-${pkgver}.tar.gz")
sha256sums=('5537b00afb7b247da0f59cc57ee5680178be61c8b2e21b5a0672b70a3d247791')

build() {
  cd "${srcdir}"/ppft-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/ppft-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

