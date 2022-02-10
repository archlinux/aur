# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=yellowbrick
pkgbase=python-yellowbrick
pkgname=('python-yellowbrick')
pkgver=1.3.post1
pkgrel=1
pkgdesc="A suite of visual analysis and diagnostic tools for machine learning"
arch=('any')
url='https://github.com/DistrictDataLabs/yellowbrick'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy' 'python-matplotlib'
         'python-scikit-learn' 'python-cycler')
optdepends=(
  'python-nltk: NLTK as the PosTagVisualizer/postag parser'
  'python-spacy: SpaCy as the PosTagVisualizer/postag parser'
  'python-pandas: Datasets as pandas.DataFrame instead of numpy arrays'
  'python-umap-learn: UMAP Corpus Visualization with UMAPVisualizer/umap'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c77e2e2f4897ca9b6aa68f094de0819dc3d0734012a7416e9225442830925d57')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  rm -rf tests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
