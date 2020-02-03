#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Rich Li <rich@dranek.com>

pkgname=python-xarray
pkgver=0.15.0
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
url="http://xarray.pydata.org"
arch=('any')
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-pandas')
optdepends=(
  'python-netcdf4: netCDF4 support'
  'python-scipy: Interpolation and fallback netCDF3 support'
  'python-h5netcdf: Alternative for netCDF4 support'
  'python-zarr: Chunked, compressed N-dimensional arrays'
  'python-cftime: Datetime support for non-standard calendars and distant dates'
  'python-rasterio: Read GeoTiffs and other gridded raster datasets'
  'python-bottleneck: Faster NaN-skipping and rolling window aggregations'
  'python-dask: Enable out-of-core parallel computation'
  'python-matplotlib: Plotting support'
  'python-cartopy: Plotting of cartographic data'
  'python-seaborn: Improved color palettes for plots'
  'python-sparse: Sparse multi-dimensional arrays'

)
checkdepends=('python-pytest')
replaces=('python-xray')
source=("https://files.pythonhosted.org/packages/source/x/xarray/xarray-${pkgver}.tar.gz")
md5sums=('75199f462de36f36b89b3f374ad7ec98')
sha256sums=('c72d160c970725201f769e80fb91cbad68d6ebf21d68fcc371385a6c950459c3')

build() {
  cd "$srcdir/xarray-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/xarray-$pkgver"
  pytest
}

package() {
  cd "$srcdir/xarray-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
