# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-mahotas
pkgver=1.2.3
pkgrel=1
pkgdesc='A set of functions for image processing in Python'
arch=('x686' 'x86_64')
url='http://luispedro.org/software/mahotas'
license=('GPL')
depends=('python2-numpy')
makedepends=('python2-distribute')
optdepends=('python2-scipy' 'python2-matplotlib' 'freeimage')
source=("http://pypi.python.org/packages/source/m/mahotas/mahotas-$pkgver.tar.gz")
md5sums=('0fe9415320d8c3e4c301a93e1d315239')

build() {
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py build
}

package() {  
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

