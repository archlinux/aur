# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname='python-geoviews'
pkgver=1.6.2
pkgrel=1
pkgdesc='Simple, concise geographical visualization in Python'
arch=('any')
url='https://github.com/pyviz/geoviews'
license=('BSD')
makedepends=('python-setuptools' 'python-param')
groups=('bokeh-ecosystem')
depends=('python-bokeh'
         'python-cartopy'
         'python-holoviews'
         'python-numpy'
         'python-param')
optdepends=('python-datashader'
            'python-geopandas'
            'python-netcdf4'
            'python-gdal'
            'python-matplotlib>2.2'
            'python-pandas'
            'python-pyct'
            'python-scipy'
            'python-shapely'
            'python-xarray'
            'jupyter')
checkdepends=('python-pytest'
              'python-coveralls'
              'python-nose'
              # 'python-nbsmoke' # This package is missing
              'flake8')
source=("https://github.com/pyviz/geoviews/archive/v${pkgver}.tar.gz")
sha256sums=('b89c44168891fff3071e38a671a8f7806179a60733dbedc2a32143ebabc2b974')

build() {
  cd "${srcdir}/geoviews-${pkgver}"
  python setup.py build
}

package_python-geoviews() {
  cd "${srcdir}/geoviews-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
