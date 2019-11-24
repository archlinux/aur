# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-mahotas
pkgver=1.4.9
pkgrel=1
pkgdesc='A set of functions for image processing in Python'
arch=('i686' 'x86_64')
url='http://mahotas.readthedocs.io/en/latest/'
license=('GPL')
depends=('python2-numpy')
makedepends=('python2-distribute')
optdepends=('python2-scipy' 'python2-matplotlib' 'freeimage')
checkdepends=('python2-scipy' 'python2-imread' 'python2-nose' 'python2-pillow')
source=($pkgname-$pkgver.tar.gz::https://github.com/luispedro/mahotas/archive/v$pkgver.tar.gz)
sha256sums=('9ff08ba9a91bc0d5b5d176ceecd351311e321b66ca4b87d90cea0fef84255148')

build() {
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py test
}

package() {  
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
