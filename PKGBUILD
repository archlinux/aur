# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-mahotas
pkgver=1.4.5
pkgrel=1
pkgdesc='A set of functions for image processing in Python'
arch=('i686' 'x86_64')
url='http://mahotas.readthedocs.io/en/latest/'
license=('GPL')
depends=('python2-numpy')
makedepends=('python2-distribute')
optdepends=('python2-scipy' 'python2-matplotlib' 'freeimage')
source=("https://github.com/luispedro/mahotas/archive/v$pkgver.tar.gz")
sha256sums=('79ab44d6fa9b013d9cc59a9cb32c118ace508f15c56e34a1ca76b6a895afd07c')

build() {
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py build
}

package() {  
  cd "$srcdir/mahotas-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
