# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=rasterio
pkgname=('python2-rasterio')
pkgver=1.0b1
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
sha256sums=('0bd8737952e99954d4e86b695cb944bf2b8f2a4d722d9bf4fe81ec5b1b5bd527'
            '1c4441fa02d6ced2ea5f3eab586b5aedb25b934ca6d61fce351c18569930b799')
_pypi='https://files.pythonhosted.org/packages'
_path='d1/de/4a0e38dfb6c82304f8f5051babd7ca2603a35eb9805783044acece249565'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/mapbox/$_name/$pkgver/LICENSE.txt")

build() {
  cd "$srcdir/rasterio-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/rasterio-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 ../LICENSE.txt \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
