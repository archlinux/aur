# Maintainer: Filip Graliński <filipg@amu.edu.pl>

pkgname=python-transformers
pkgver=4.11.3
pkgrel=2
pkgdesc="State-of-the-art Natural Language Processing for Jax, PyTorch and TensorFlow"
arch=('i686' 'x86_64')
url="https://pypi.org/project/transformers"
license=('Apache License 2.0')
depends=('cuda'
         'nccl'
         'python-filelock'
         'python-pytorch'
         'python-sacremoses'
         'python-tokenizers'
         'python-tqdm')

source=("https://files.pythonhosted.org/packages/52/9a/d7a8dea8ebab15198877ed5b6d718ed04373987854a21e91c1948d555456/transformers-${pkgver}.tar.gz")
sha256sums=('755b052df58906f122f7166c573c22531416eab8a9f59c44ff7148be12e62621')

build() {
    cd transformers-$pkgver
    python setup.py build
}

package() {
    cd transformers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
