# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=rasterio
pkgname=('python2-rasterio')
pkgver=1.0.24
pkgrel=1
pkgdesc="Fast and direct raster I/O for use with Numpy and SciPy (Python 2)"
arch=('x86_64')
url="https://github.com/mapbox/rasterio"
license=('BSD')
makedepends=('python2-setuptools' 'cython2')
depends=('python2-affine' 'python2-cligj' 'python2-numpy' 'python2-snuggs'
         'python2-attrs' 'python2-click'
         'python2-click-plugins' 'python2-enum34' 'python2-setuptools' 'gdal')
optdepends=('ipython2: Alternative inspector interpreter (rio insp --ipython)'
            'python2-boto3: AWS S3 raster access'
            'python2-matplotlib: plt object (rio insp), rasterio.plot module')
options=(!emptydirs)
sha256sums=('4839479621045211f66868ec49625979693450bc2e476f23e7e8ac4804eaf452')
_pypi='https://files.pythonhosted.org/packages'
_path='57/84/be5689470a73f5f8988cf44b81cb3493ebb8abbbebb69768c8fc86fccdd5'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
