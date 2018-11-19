# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-rasterio
_pyname=rasterio
pkgver=1.0.10
pkgrel=1
pkgdesc='Python library for reading and writing geospatial raster data.'
url='https://github.com/mapbox/rasterio'
arch=('x86_64')
license=('MIT')
depends=('python' 'gdal' 'python-numpy' 'python-affine' 'python-attrs' 'python-cligj' 'python-snuggs' 'python-click-plugins')
makedepends=('python-setuptools' 'cython' 'python-pytest' 'python-hypothesis' 'python-boto3')
source=("https://files.pythonhosted.org/packages/86/0a/a4ef029e5d2b3fc3a0c9c8846e44ee35797d814ff4ab3cd0ac76fc002584/rasterio-1.0.10.tar.gz")

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm755 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('26933c002ad5084b3b394136dec94d36f586b29564d9ee21817b7b5d073bc190')
