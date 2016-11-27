# Maintainer: PhiBo <phibo at dinotools dot org>

pkgname=python2-ssdeep
pkgver=3.2
pkgrel=1
pkgdesc='Python wrapper for ssdeep fuzzy hashing library'
arch=('i686' 'x86_64')
license=('LGPLv3+')
url='https://pypi.python.org/pypi/ssdeep'
makedepends=('python2-setuptools' 'python2-six' 'python2-cffi' 'ssdeep')
depends=('python2' 'python2-six' 'python2-cffi' 'ssdeep')
checkdepends=('python2-pytest')
source=("https://github.com/DinoTools/python-ssdeep/archive/${pkgver}.tar.gz")
md5sums=('5d2b4b9ecca30e410da44ecd129d0dc7')

build() {
   cd python-ssdeep-${pkgver}
   python2 setup.py build
}

check() {
   cd "${srcdir}"/python-ssdeep-${pkgver}
   # This will be fixed in version 3.2.1 (See: #20)
   # python2 setup.py test
}
 
package() {
   cd python-ssdeep-${pkgver}
   python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
} 
