# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-evaluate'
pkgver=0.4.0
pkgrel=1
pkgdesc='HuggigFace library for easily evaluating machine learning models and datasets'
arch=('x86_64')
url='https://github.com/huggingface/evaluate/'
license=('Apache')
depends=('python-datasets>=2.0.0'
         'python-dill'
         'python-fsspec>=2021.05.0'
         'python-huggingface-hub>=0.7.0'
         'python-huggingface-hub<1.0.0'
         'python-multiprocess'
         'python-numpy>=1.17'
         'python-pandas'
         'python-requests>=2.19.0'
         'python-scipy>=1.7.1'
         'python-tqdm>=4.62.1'
         'python-xxhash')
makedepends=('python-pip' 'python-packaging' 'python-setuptools')
optdepends=('python-transformers')
groups=('huggingface')
source=("evaluate-${pkgver}.tar.gz::https://github.com/huggingface/evaluate/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1c7326d69362e13ddeb9c27e5a7b1c999c1c8ff4b009cba7256aa7bdb47cd4c')

build() {
    cd $srcdir/evaluate-$pkgver
    python setup.py bdist_wheel
}

package() {
    cd $srcdir/evaluate-$pkgver
    pip -v --no-python-version-warning \
        install --ignore-installed --no-deps --no-warn-script-location \
        --root $pkgdir .
}
