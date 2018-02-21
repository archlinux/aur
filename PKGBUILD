# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-mahotas
pkgver=1.4.4
pkgrel=1
pkgdesc='A set of functions for image processing in Python'
arch=('x686' 'x86_64')
url='http://mahotas.readthedocs.io/en/latest/'
license=('GPL')
depends=('python2-numpy')
makedepends=('python2-distribute')
optdepends=('python2-scipy' 'python2-matplotlib' 'freeimage')
source=("https://github.com/luispedro/mahotas/archive/v$pkgver.tar.gz")
md5sums=('b9eab4a4fc37a15bcda4316533d4bead')

build() {
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py build
}

package() {  
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
