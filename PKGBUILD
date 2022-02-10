# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=yellowbrick
pkgbase=python-yellowbrick
pkgname=('python-yellowbrick')
pkgver=1.3
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
sha256sums=('467989fab1c5bbbe3802ccba6b103aefbe0b0042b6680df569d7aa8991e8739e')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  rm -rf tests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
