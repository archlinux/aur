# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-wsaccel
pkgver=0.6.2
_commit=f16d0b8cd9b54b5b2d7698a5b41d5c38e1564fb6
pkgrel=3
pkgdesc='Accelerator for ws4py and AutobahnPython (Python2 version)'
arch=('x86_64')
url='https://github.com/methane/wsaccel'
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools' 'cython2' 'git')
checkdepends=('python2-pytest-runner')
source=("git+https://github.com/methane/wsaccel.git#commit=$_commit")
md5sums=('SKIP')

prepare() {
  mv wsaccel{,-py2}
}

build() {
  cd "$srcdir"/wsaccel-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/wsaccel-py2
  python2 setup.py pytest
}

package() {
  cd wsaccel-py2
  python2 setup.py install --root="$pkgdir" -O1
}
