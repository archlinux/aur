_name=paillier
pkgname="python-$_name"
pkgver=1.4.0
pkgrel=1
arch=('any')
pkgdesc="A Python 3 library implementing the Paillier Partially Homomorphic Encryption."
url="https://github.com/data61/python-paillier"
license=('GPL3')
source=("https://github.com/data61/python-paillier/archive/1.4.0.tar.gz")
sha512sums=('0d0a8677cbe9be38dba70fe3bf3a20b9b4024e8f0b20e34d85df9873b8a4f6ef4efc31d083d4bacbb1912c147c14cec854bcec819f641f7787f9b7e3063d8507')
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
