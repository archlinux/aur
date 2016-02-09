# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-pydstool
_pkgname=pydstool
_pkgName=PyDSTool
pkgver=0.90.2
pkgrel=1
pkgdesc="Simulation and analysis environment for dynamical systems"
url="http://www2.gsu.edu/~matrhc/ProjectOverview.html"
license=('BSD')
arch=('any')
depends=('python2-numpy' 'python2-scipy')
makedepends=('dos2unix')
optdepends=('python2-sloppycell')
replaces=('pydstool')
source=("http://downloads.sourceforge.net/$pkgname/$_pkgName-$pkgver.tar.gz")
options=('!emptydirs')
md5sums=('0047b41fa583b48d3a477ab63b39cb38')

build() {
  cd "$srcdir/robclewley-pydstool-9ecaefa"
  python2 setup.py build
}

package() {
  cd "$srcdir/robclewley-pydstool-9ecaefa"
  python2 setup.py install --skip-build --prefix="/usr" --root="$pkgdir" --optimize=1
}
