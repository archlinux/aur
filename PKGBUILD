# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=mapclassify
pkgname=python-mapclassify
pkgver=2.3.0
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
  'pytest-cov: tests'
  'python-codecov: tests'
  'python-geopandas: tests'
  'libpysal: tests'
  'palettable: tests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bfe1ec96afe7f866560d25f9f00e5c4dae97d5b69dfe758dbe02c4993261365b')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
