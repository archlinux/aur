# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python2-rasterio')
pkgver=1.0a8
pkgrel=1
pkgdesc="Fast and direct raster I/O for use with Numpy and SciPy (Python 2)"
arch=('i686' 'x86_64')
url="https://github.com/mapbox/rasterio"
license=('BSD')
makedepends=('cython2')
depends=('python2-affine' 'python2-cligj' 'python2-numpy' 'python2-snuggs'
         'python2-click-plugins' 'python2-enum34' 'python2-setuptools' 'gdal')
options=(!emptydirs)
source=("$url/archive/$pkgver.zip")
sha256sums=('65aa0cc9bda60c8d2401786101b029bbbfd1a2514133c9ed46cf5fa7e41b9167')

build() {
  cd "$srcdir/rasterio-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/rasterio-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
