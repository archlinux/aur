# Maintainer: Eugene Dvoretsky <radioxoma at gmail.com>

pkgname=('python2-centrosome')
pkgver=1.0.7
pkgrel=1
pkgdesc="CellProfiler’s python image processing library"
arch=('i686' 'x86_64')
url="https://github.com/CellProfiler/centrosome"
license=('BSD')
depends=('python2-numpy' 'python2-scipy')
makedepends=('python2-setuptools' 'cython2')
source=("https://github.com/CellProfiler/centrosome/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/centrosome-$pkgver"
}

build() {
  cd "$srcdir/centrosome-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/centrosome-$pkgver"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
