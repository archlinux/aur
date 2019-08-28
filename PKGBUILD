# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-rasterio
_pyname=rasterio
pkgver=1.0.26
pkgrel=1
pkgdesc='Python library for reading and writing geospatial raster data.'
url='https://github.com/mapbox/rasterio'
arch=('x86_64')
license=('MIT')
depends=('python' 'gdal' 'python-numpy' 'python-affine' 'python-attrs' 'python-cligj' 'python-snuggs' 'python-click-plugins')
makedepends=('python-setuptools' 'cython' 'python-pytest' 'python-hypothesis' 'python-boto3')
source=("https://files.pythonhosted.org/packages/source/r/$_pyname/$_pyname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm755 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('9d5246631b2295b9fb417f220d009a1954aeb5895c9e27bab71fc143f4ba5633')
