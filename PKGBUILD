# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-rasterio
_pyname=rasterio
pkgver=1.1.0
pkgrel=1
pkgdesc='Python library for reading and writing geospatial raster data.'
url='https://rasterio.readthedocs.io/en/stable/'
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

sha256sums=('77aa68860da9d9382cee0294b78809b04ad4f884ea95d1dec084f2f9bab105e8')
