# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

_name=libpysal
pkgname=python-libpysal
pkgver=4.6.0
pkgrel=1
pkgdesc="Core components of Python Spatial Analysis Library."
arch=('any')
url="https://pysal.org/libpysal/"
license=('BSD')
depends=(
  'python-beautifulsoup4'
  'python-jinja'
  'python-numpy'
  'python-pandas'
  'python-requests'
  'python-scipy'
)
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
b2sums=('39c615ee86d7e344db104c2b11b8aac3ac03b7bde80be9b48f5dbdc6f92f14f6ce187d39b39226ab5f564156a66b80afc9b29e02a243c60c65964fc147dfb389')

build() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
