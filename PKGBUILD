# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-gpib-ctypes
pkgver=0.3.0
pkgrel=1
pkgdesc="Cross-platform Python bindings for the NI GPIB and linux-gpib C interfaces."
arch=('x86_64')
url=https://github.com/tivek/gpib_ctypes
license=('GPL2')
depends=(python linux-gpib)
makedepends=(python-setuptools)
source=(https://github.com/tivek/gpib_ctypes/archive/${pkgver}.tar.gz)
sha256sums=('549b532418e11dceeef1e694b2bb6c88734d382583b999c572cee61b610a70f7')

prepare() {
  cd "$srcdir/gpib_ctypes-$pkgver"
}

build() {
  cd "$srcdir/gpib_ctypes-$pkgver"
  python setup.py build
}


package() {
  cd "$srcdir/gpib_ctypes-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
