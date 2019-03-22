pkgname=python-pathos
pkgver=0.2.3
pkgrel=1
pkgdesc="parallel graph management and execution in heterogeneous computing"
url="http://trac.mystic.cacr.caltech.edu/project/pathos/wiki.html"
arch=(any)
license=('BSD')
makedepends=('python-setuptools')
depends=('python-ppft' 'python-pox' 'python-multiprocess')
source=("https://github.com/uqfoundation/pathos/archive/pathos-${pkgver}.tar.gz")
sha256sums=('5a325a19f66bd92fe3978febf4e96b8836f45f851ab23b07eaf589beac9c21bc')

build() {
  cd "${srcdir}"/pathos-pathos-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/pathos-pathos-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


