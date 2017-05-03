# Maintainer: Eugene Dvoretsky <radioxoma at gmail.com>

pkgname=('python2-bioformats')
pkgver=1.1.0
pkgrel=1
pkgdesc="Python wrapper for Bio-Formats, a standalone Java library for reading and writing life sciences image file formats."
arch=('i686' 'x86_64')
url="https://github.com/CellProfiler/python-bioformats"
license=('BSD')
depends=('python2-javabridge')

source=("https://github.com/CellProfiler/python-bioformats/archive/${pkgver}.tar.gz")
sha256sums=('57e873553280b29aa73bfdba79e2cc88f3ee791546009ad9cdf42679a5a32246')

build() {
  cd "$srcdir/python-bioformats-$pkgver"
  python2 setup.py build
}

# check() {
#   cd "$srcdir/python-bioformats-$pkgver"
#   python2 setup.py test
# }

package() {
  cd "$srcdir/python-bioformats-$pkgver"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
