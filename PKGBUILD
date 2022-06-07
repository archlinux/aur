# Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: MCMic <come@chilliet.eu>

pkgname=python-pyscroll
pkgver=2.29
pkgrel=1
pkgdesc="A generic module for making a fast scrolling image with pygame."
arch=('any')
url="https://github.com/bitcraft/pyscroll"
license=(LGPL3)
depends=(python-pygame)
makedepends=(git python-setuptools)
_commit=da826cd81abd48de8929601b07f39d4375b9c33e
source=("git+https://github.com/bitcraft/pyscroll.git#commit=$_commit")
md5sums=(SKIP)

package() {
  cd ${srcdir}/pyscroll
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
}

check() {
    cd ${srcdir}/pyscroll
    python -m unittest tests/pyscroll/test_pyscroll.py
}
