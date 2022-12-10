# Maintainer: Filip Graliński <filipg@amu.edu.pl>

pkgname=python-transformers
pkgver=4.25.1
pkgrel=1
pkgdesc="State-of-the-art Natural Language Processing for Jax, PyTorch and TensorFlow"
arch=('i686' 'x86_64')
url="https://pypi.org/project/transformers"
license=('Apache License 2.0')
depends=('python-filelock'
         'python-tokenizers'
         'python-huggingface-hub'
         'python-numpy'
         'python-packaging'
         'python-yaml'
         'python-regex'
         'python-requests'
         'python-tqdm')
optdepends=(
       'python-pytorch: PyTorch support'
       'python-tensorflow: TensorFlow support'
       'python-onnxconverter-common: TensorFlow support'
       'python-tf2onn: TensorFlow support'
       'python-jax: JAX support'
       'python-jaxlib: JAX support'
       'python-flax: JAX support'
       'python-optax: JAX support'
)

source=("https://github.com/huggingface/transformers/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d3ee551c133bac19ea76cbed4a860d875bed4a08e080b85be2e1eb38f874ee17')

build() {
    cd transformers-$pkgver
    python setup.py build
}

package() {
    cd transformers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
