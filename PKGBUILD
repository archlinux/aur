# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=libpysal
pkgname=python-libpysal
pkgver=4.4.0
pkgrel=1
pkgdesc="Core components of Python Spatial Analysis Library."
arch=('any')
url="https://pysal.org/libpysal/"
license=('BSD')
depends=('python-beautifulsoup4' 'python-jinja' 'python-numpy' 'python-pandas' 'python-requests' 'python-scipy')
optdepends=(
  'python-pypandoc: documents'
  'python-nbsphinx: documents'
  'python-sphinx: documents'
  'python-sphinx-gallery: documents'
  'python-sphinx-bootstrap-theme: documents'
  'python-sphinxcontrib-bibtex: documents'
  'python-numpydoc: documents'
  'python-pytest: tests'
  'python-pytest-cov: tests'
  'python-pytest-cov: tests'
  'python-matplotlib: tests, plus conda'
  'python-codecov: tests'
  'python-geomet: plus pip'
  'python-bokeh: plus conda'
  'python-folium: plus conda'
  'python-geojson: plus conda'
  'python-geopandas: plus conda'
  'python-mplleaflet: plus conda'
  'python-numba: plus conda'
  'python-numexpr: plus conda'
  'python-networkx: plus conda'
  'python-scikit-learn: plus conda'
  'python-seaborn: plus conda'
  'python-sqlalchemy: plus conda'
  'python-statsmodels: plus conda'
  'python-xarray: plus conda'
  'python-black: dev tool'
  'python-pre-commit: dev tool'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('216eb73a276d9975e604217bd931dc3b7770a6efa95999952d027827fad51e0c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
