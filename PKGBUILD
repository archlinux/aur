# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
_name=libpysal
pkgname=python-libpysal
pkgver=4.14.1
pkgrel=1
pkgdesc="Core components of Python Spatial Analysis Library."
arch=('any')
url="https://pysal.org/libpysal/"
license=('BSD')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-fiona'
  'python-geopandas'
  'python-joblib'
  'python-numpy'
  'python-packaging'
  'python-pandas'
  'python-platformdirs'
  'python-pooch'
  'python-requests'
  'python-scikit-learn'
  'python-scipy'
  'python-shapely'
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
  'python-mplleaflet: plus conda'
  'python-numba: plus conda'
  'python-numexpr: plus conda'
  'python-networkx: plus conda'
  'python-seaborn: plus conda'
  'python-sqlalchemy: plus conda'
  'python-statsmodels: plus conda'
  'python-xarray: plus conda'
  'python-black: dev tool'
  'python-pre-commit: dev tool'
)
makedepends=(
  'python-setuptools-scm'
  'python-build'
  'python-installer'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('0937a255fd4be95ae0ff4aef41e94a32124dc1fd9c2a679f396aa8786631081b73c7426b949e525150399cbe0d1c0390ddb2ab325668b71e5d40da7f67fbff16')

build() {
  cd "$srcdir/$_name-$pkgver" || exit

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl

  # install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
