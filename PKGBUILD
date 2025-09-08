# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: pumpkincheshire <me at pumpkinCheshire dot com>

pkgname='python-contextily'
_name=contextily
pkgver=1.6.2
pkgrel=1
pkgdesc='Context geo-tiles in Python'
arch=('any')
url='https://github.com/geopandas/contextily'
license=('MIT')
makedepends=(python-build python-installer python-setuptools-scm)
depends=(
  'python'
  'python-geopy'
  'python-matplotlib'
  'python-mercantile'
  'python-numpy'
  'python-pillow'
  'python-rasterio'
  'python-requests'
  'python-joblib'
  'python-xyzservices'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('ff921ab39f5f2fecc1d6228702c238d46e5ebb8bae571f3cd332db766a37772cb4560711217b2af21ad6d89f13ddef1518762dff74fe63ca7cee109aa0bede81')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
