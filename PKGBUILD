# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: pumpkincheshire <me at pumpkinCheshire dot com>

pkgname='python-contextily'
_name=contextily
pkgver=1.5.1
pkgrel=1
pkgdesc='Context geo-tiles in Python'
arch=('any')
url='https://github.com/geopandas/contextily'
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(
  'python-geopy'
  'python-matplotlib'
  'python-mercantile'
  'python-pillow'
  'python-rasterio'
  'python-requests'
  'python-joblib'
  'python-xyzservices'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('cc0ced1dafc4dd423cdbcdaa76aedc701e7082493b239e089824f7bbbf1f68f041890b13e09d7c63d12f957bc5695ae2cd5b710e74a2cf6956befd9d3eae891d')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
