# Maintainer: PhiBo <phibo at dinotools dot org>

pkgname=python-ssdeep
pkgver=3.1.1
pkgrel=1
pkgdesc='Python wrapper for ssdeep fuzzy hashing library'
arch=('i686' 'x86_64')
license=('LGPLv3+')
url='https://pypi.python.org/pypi/ssdeep'
makedepends=('python-setuptools' 'python-six' 'python-cffi' 'ssdeep')
depends=('python' 'python-six' 'python-cffi' 'ssdeep')
checkdepends=('python-pytest')
source=("https://github.com/DinoTools/python-ssdeep/archive/${pkgver}.tar.gz")
md5sums=('18c9b2431c2a33645a9ec930ee630532')

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
