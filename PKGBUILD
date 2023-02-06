pkgname=python-ssdeep
pkgver=3.4
pkgrel=1
pkgdesc='Python wrapper for ssdeep fuzzy hashing library'
arch=('i686' 'x86_64')
license=('LGPL3')
url='https://pypi.python.org/pypi/ssdeep'
makedepends=('python-setuptools' 'python-pip')
depends=('python' 'python-cffi' 'ssdeep')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DinoTools/python-ssdeep/archive/${pkgver}.tar.gz")
sha256sums=('1924ca700aedd6563b9939cac6519d5aa24c4c3c24e09a748b31c09955b09ad4')

build() {
   cd python-ssdeep-${pkgver}
   python3 setup.py build
}

check() {
   cd "${srcdir}"/python-ssdeep-${pkgver}
   python3 setup.py test
}
 
package() {
   cd python-ssdeep-${pkgver}
   python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
} 
