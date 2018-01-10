# Maintainer: PhiBo <phibo at dinotools dot org>

pkgname=python2-ssdeep
pkgver=3.3
pkgrel=1
pkgdesc='Python wrapper for ssdeep fuzzy hashing library'
arch=('i686' 'x86_64')
license=('LGPLv3+')
url='https://pypi.python.org/pypi/ssdeep'
makedepends=('python2-setuptools' 'python2-six' 'python2-cffi' 'ssdeep')
depends=('python2' 'python2-six' 'python2-cffi' 'ssdeep')
checkdepends=('python2-pytest')
source=("https://github.com/DinoTools/python-ssdeep/archive/${pkgver}.tar.gz")
sha256sums=('31bd3c20a9c066f5cd89fa90073320ea43c08c09fb995e4284c6bcf055704e89')

build() {
   cd python-ssdeep-${pkgver}
   python2 setup.py build
}

check() {
   cd "${srcdir}"/python-ssdeep-${pkgver}
   python2 setup.py test
}
 
package() {
   cd python-ssdeep-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
} 
