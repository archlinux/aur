# Maintainer: PhiBo <phibo at dinotools dot org>

pkgname=python-ssdeep
pkgver=3.3
pkgrel=1
pkgdesc='Python wrapper for ssdeep fuzzy hashing library'
arch=('i686' 'x86_64')
license=('LGPLv3+')
url='https://pypi.python.org/pypi/ssdeep'
makedepends=('python-setuptools' 'python-six' 'python-cffi' 'ssdeep')
depends=('python' 'python-six' 'python-cffi' 'ssdeep')
checkdepends=('python-pytest')
source=("https://github.com/DinoTools/python-ssdeep/archive/${pkgver}.tar.gz")
sha256sums=('31bd3c20a9c066f5cd89fa90073320ea43c08c09fb995e4284c6bcf055704e89')

build() {
   cd python-ssdeep-${pkgver}
   python3 setup.py build
}

check() {
   cd "${srcdir}"/python-ssdeep-${pkgver}
   # This will be fixed in version 3.2.1 (See: #20)
   # python3 setup.py test
}
 
package() {
   cd python-ssdeep-${pkgver}
   python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
} 
