# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

_pkgname=python2-pycpa
pkgname=$_pkgname-git
pkgver=20200908
pkgrel=1
pkgdesc="Pragmatic Python implementation of Compositional Performance Analysis (aka the SymTA/S approach provided by Symtavision) used for research in worst-case timing analysis."
arch=('any')
makedepends=('git')
depends=('python2' 'python2-matplotlib' 'simpy' 'python2-setuptools' 'python2-nose' 'python2-tornado')
provides=('python2-pycpa')
replaces=('python2-pycpa-git')
url="https://bitbucket.org/pycpa/pycpa/"
license=('MIT')

source=("git+https://bitbucket.org/pycpa/pycpa")
md5sums=("SKIP")

build() {
  cd ${srcdir}/pycpa
  python2 setup.py build
}

package() {
  cd ${srcdir}/pycpa
  python2 setup.py install --root="${pkgdir}"
}
