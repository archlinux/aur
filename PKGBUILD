# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
_name=libpysal
pkgname=python-libpysal
pkgver=4.13.0
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
b2sums=('6b993fccdef2bc7934b8753a17debd3c4d00f731fb5da449aa40771c3811fac6f0e1b053c1575ed2e24b7ce5b43c31229f32efc704ff317c613ee361e1451510')

build() {
  cd "$srcdir/$_name-$pkgver" || exit

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl

  # install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
