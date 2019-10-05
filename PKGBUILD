# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-mahotas
pkgver=1.4.7
pkgrel=1
pkgdesc='A set of functions for image processing in Python'
arch=('i686' 'x86_64')
url='http://mahotas.readthedocs.io/en/latest/'
license=('GPL')
depends=('python2-numpy')
makedepends=('python2-distribute')
optdepends=('python2-scipy' 'python2-matplotlib' 'freeimage')
source=($pkgname.tar.gz::https://github.com/luispedro/mahotas/archive/v$pkgver.tar.gz)
sha256sums=('d545906bc9b5f021ed0460435f89b87d6e67c86a8bff82604d1de0606458856a')

build() {
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py build
}

package() {  
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
