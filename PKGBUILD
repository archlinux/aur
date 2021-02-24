# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

pkgname='python-contextily'
_name=contextily
pkgver=1.1.0
pkgrel=1
pkgdesc='Context geo-tiles in Python'
arch=('any')
url='https://github.com/geopandas/contextily'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-geopy'
  'python-matplotlib'
  'python-mercantile'
  'python-pillow'
  'python-rasterio'
  'python-joblib')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3324cba6f9e49c70e8841957d0d8907275cd0baf001b8d1feda4868c53a9557b')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
