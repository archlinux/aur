# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-rasterio
_pyname=rasterio
pkgver=1.2.10
pkgrel=1
pkgdesc='Python library for reading and writing geospatial raster data.'
url='https://rasterio.readthedocs.io/en/stable/'
arch=('x86_64')
license=('MIT')
depends=('python' 'gdal' 'python-numpy' 'python-affine' 'python-attrs' 'python-cligj' 'python-snuggs' 'python-click' 'python-click-plugins' 'python-certifi')
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

sha256sums=('6062456047ba6494fe18bd0da98a383b6fad5306b16cd52a22e76c59172a2b5f')
