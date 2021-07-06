# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname=python-geoplot
_name=geoplot
pkgver=0.4.3
pkgrel=1
pkgdesc='High-level geospatial data visualization library for Python'
arch=('any')
url='https://github.com/ResidentMario/geoplot'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-matplotlib'
  'python-seaborn'
  'python-pandas'
  'python-geopandas'
  'python-cartopy'
  'python-descartes'
  'python-mapclassify'
  'python-contextily')
optdepends=('python-pytest'
  'python-pytest-mpl'
  'python-scipy'
  'python-pylint'
  'jupyter'
  'python-sphinx'
  'python-sphinx-gallery'
  'python-sphinx_rtd_theme'
  'python-mplleaflet')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/ResidentMario/geoplot/master/LICENSE.md")
b2sums=('eb073436c5a1cb7f97caa217cdb109e6cad4f3774e657757005e3f0f5a3183ca'
  'c1b05901300a8f7a4fc337b5197815e7f6444a1c2756e35f3d7e9b1df18146a6')
build() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #  install -Dm644 $scrdir/README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
