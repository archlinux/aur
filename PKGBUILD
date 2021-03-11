# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

_pkgname=python2-pycpa
pkgname=$_pkgname-git
pkgver=20210311
pkgrel=1
pkgdesc="Pragmatic Python implementation of Compositional Performance Analysis (aka the SymTA/S approach provided by Symtavision) used for research in worst-case timing analysis."
arch=('any')
makedepends=('git')
depends=('python2' 'python2-matplotlib' 'python2-setuptools')
optdepends=('python2-twisted: for RPC interface'
            'python2-simpy: for simulation module')
provides=('python2-pycpa')
replaces=('python2-pycpa-git')
url="https://github.com/IDA-TUBS/pycpa.git"
license=('MIT')

source=("git+https://github.com/IDA-TUBS/pycpa.git")
md5sums=("SKIP")

build() {
  cd ${srcdir}/pycpa
  python2 setup.py build
}

package() {
  cd ${srcdir}/pycpa
  python2 setup.py install --root="${pkgdir}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
