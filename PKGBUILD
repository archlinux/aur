# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='python-liblas'
pkgver='1.8.1'
pkgrel='1'
pkgdesc='Python bindings for libLAS - a C/C++ library for reading and writing LAS LiDAR format.'
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url='https://liblas.org'
license=('BSD')
options=('!emptydirs')
source=("https://pypi.python.org/packages/2f/13/1d233142092b9dcfbfd47ec9f3380361e5a7b9061408a809005abe0e60aa/libLAS-${pkgver}.tar.gz")
md5sums=('93921e0c37d47b03eea8529aa31d9073')

build() {
  cd "$srcdir/libLAS-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/libLAS-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
