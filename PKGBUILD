# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-pybindgen
pkgver=0.16.0
pkgrel=2
pkgdesc="A tool to generate Python bindings for C/C++ code"
url="http://pypi.python.org/pypi/PyBindGen"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python2' 'pygccxml')
makedepends=('waf')
provides=('python-pybindgen')
conflicts=('python-pybindgen-bzr')
source=("http://pybindgen.googlecode.com/files/pybindgen-${pkgver}.tar.bz2")
md5sums=('cfeb90233fc4a84d92307a980a3f1d0c')

build() {
  cd ${srcdir}/pybindgen-$pkgver
  PYTHON=python2 ./waf configure --prefix=/usr
  PYTHON=python2 ./waf
}

check() {
  cd ${srcdir}/pybindgen-$pkgver
  PYTHON=python2 ./waf check
}

package() {
  cd ${srcdir}/pybindgen-$pkgver
  PYTHON=python2 ./waf install --prefix=/usr --destdir=${pkgdir}
}
