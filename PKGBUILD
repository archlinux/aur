# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=rasterio
pkgname=('python2-rasterio')
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast and direct raster I/O for use with Numpy and SciPy (Python 2)"
arch=('x86_64')
url="https://github.com/mapbox/rasterio"
license=('BSD')
makedepends=('python2-setuptools' 'cython2')
depends=('python2-affine' 'python2-cligj' 'python2-numpy' 'python2-snuggs'
         'python2-attrs'
         'python2-click-plugins' 'python2-enum34' 'python2-setuptools' 'gdal')
optdepends=('ipython2: Alternative inspector interpreter (rio insp --ipython)'
            'python2-boto3: AWS S3 raster access'
            'python2-matplotlib: plt object (rio insp), rasterio.plot module')
options=(!emptydirs)
sha256sums=('6f2e90f2b740d727b36e39550e2a949d52551717812f9b4748f9bc351d666274')
_pypi='https://files.pythonhosted.org/packages'
_path='33/22/ad2ea27c9829582ab5280f35cc61e424970ce0add34e258c9e171a62cb73'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")

build() {
  cd "$srcdir/rasterio-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/rasterio-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
