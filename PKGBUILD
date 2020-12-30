# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=mapclassify
pkgname=python-mapclassify
pkgver=2.4.2
pkgrel=1
pkgdesc="Classification schemes for choropleth mapping."
arch=('any')
url="https://github.com/pysal/mapclassify"
license=('BSD')
depends=('python-scipy' 'python-numpy' 'python-scikit-learn' 'python-pandas' 'python-networkx')
optdepends=('python-sphinx: documents'
  'python-sphinx-gallery: documents'
  'python-sphinx-bootstrap-theme: documents'
  'python-sphinxcontrib-bibtex: documents'
  'python-numpydoc: documents'
  'python-pytest: tests'
  'python-pytest-cov: tests'
  'python-codecov: tests'
  'python-geopandas: tests'
  'python-libpysal: tests'
  'python-palettable: tests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bc20954aa433466f5fbc572e3f23b05f9606b59209f40b0ded93ac1ca983d24e')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
