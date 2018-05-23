# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=('python-rasterio')
_pyname=rasterio
pkgver=1.0a12
pkgrel=1
pkgdesc='Python library for reading and writing geospatial raster data.'
url='https://github.com/mapbox/rasterio'
arch=('x86_64')
license=('MIT')
depends=('python' 'gdal' 'python-numpy' 'python-affine' 'python-attrs' 'python-cligj' 'python-snuggs' 'python-click-plugins')
makedepends=('python-setuptools' 'cython' 'python-pytest' 'python-hypothesis' 'python-boto3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mapbox/$_pyname/archive/$pkgver.tar.gz")

check() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py test
}

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm755 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('c36337d22723fe7e3309e8ea364932aeae42fc00a844398f136a78f336873b30')
