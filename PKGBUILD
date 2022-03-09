# Contributor: Michel Zou <xantares09@hotmail.com>
_base=sciscipy
pkgname=python-${_base}
pkgver=1.0.1
pkgrel=1
pkgdesc="A Scilab API for Python"
arch=(any)
url="http://forge.scilab.org/index.php/p/${_base}"
license=(GPL)
depends=(python-numpy scilab)
makedepends=(python-setuptools)
source=(${url}/downloads/get/${_base}-${pkgver}.tar.gz)
sha512sums=('2aef9505ae61182e349a2d97cc6efc83e5ab3735f66d9084f2861cd0ff19a82d86d729ec8c9b6dcafc8518c91ef26ce3ffc7decac7064fe4b10ea9e761a231e6')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# test:
# SCI=/usr/share/scilab LD_LIBRARY_PATH=/usr/lib/jvm/java-7-openjdk/jre/lib/amd64/server/:/usr/lib/scilab/:/usr/lib/jvm/java-7-openjdk/jre/lib/amd64/ python2 src/sciscipy-1.0.1/tests/test_call.py
