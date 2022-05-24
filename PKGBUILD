#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

_name=libpysal
pkgname=python-libpysal
pkgver=4.6.2
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
makedepends=(
  'python-wheel'
  'python-build'
  'python-installer'
  'python-pytest-runner'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('92eac6b46acb8adef6c8d64e63fb85a902d8835888a5fb7bfa31a923d0090186ad00eec00afa7c511ec0db54162f2be734e1329612ec70fa5b30487ad839f435')

build() {
  cd "$srcdir/$_name-$pkgver" || exit

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl

  # install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
