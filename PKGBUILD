_name=paillier
pkgname="python-$_name"
pkgver=1.5.1
pkgrel=1
arch=('any')
pkgdesc="A Python 3 library implementing the Paillier Partially Homomorphic Encryption."
url="https://github.com/data61/python-paillier"
license=('GPL3')
source=("https://github.com/data61/python-paillier/archive/$pkgver.tar.gz")
sha512sums=('5f8ea50f8513515a4da9ae7fe5522377cc8431a69e5e932166c5971c271d1c88db78cd5150408b5beb8fff2af08e33112888248c45234de291d39b5e94ee37ac')
depends=(
  'python'
)
makedepends=('python-setuptools')

build() {
  cd "${srcdir}/python-${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/python-${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
