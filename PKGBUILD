pkgname=python-sentence-transformers
pkgver=2.2.2
pkgrel=1
pkgdesc="Multilingual Sentence & Image Embeddings with BERT "
depends=('python' 'python-transformers' 'python-tokenizers' 'python-tqdm' 'python-pytorch' 'python-torchvision' 'python-numpy' 'python-scikit-learn' 'python-scipy' 'python-nltk' 'python-sentencepiece' 'python-huggingface-hub')
makedepends=('python-setuptools')
arch=('x86_64')
url="https://github.com/UKPLab/sentence-transformers"
license=('LGPL3')
source=("https://github.com/UKPLab/sentence-transformers/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77b04de170b98a12dd61c38c8a5d5277e50e4d435c3776e1b0bcbea24196ae6a')

build() {
  cd "${srcdir}/sentence-transformers-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/sentence-transformers-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
