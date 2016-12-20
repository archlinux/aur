# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-sloppycell
pkgver=r860.14366d3
pkgrel=1
epoch=1
pkgdesc="Software environment for simulation and analysis of biomolecular networks"
arch=('i686' 'x86_64')
url="http://sloppycell.sourceforge.net/"
license=('BSD')
depends=('python2-scipy' 'python2-numpy' 'lapack')
makedepends=('git' 'gcc-fortran')
source=("git+http://git.code.sf.net/p/sloppycell/git"
        "setup.patch")
md5sums=('SKIP'
         '3b7af95a88305880a8fc1340c7a0790f')

pkgver() {
  cd "$srcdir"/git
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/git
  python2 setup.py build
}

package() {
  cd "$srcdir"/git
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}
