# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python2-rasterio')
pkgver=1.0a5
pkgrel=1
pkgdesc="Fast and direct raster I/O for use with Numpy and SciPy (Python 2)"
arch=('i686' 'x86_64')
url="https://github.com/mapbox/rasterio"
license=('BSD')
makedepends=('python2-setuptools' 'cython2')
depends=('python2-affine' 'python2-cligj' 'python2-numpy' 'python2-snuggs'
         'python2-click-plugins' 'python2-enum34' 'gdal')
options=(!emptydirs)
source=("$url/archive/$pkgver.zip")
sha256sums=('d773506efa63ee0d367b32c34ae40ff4a2f61254be3a01f038dc68eb9ba1fbb0')

build() {
  cd "$srcdir/rasterio-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/rasterio-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
