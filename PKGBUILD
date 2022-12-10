# Maintainer: Filip Graliński <filipg@amu.edu.pl>

pkgname=python-transformers
pkgver=4.19.2
pkgrel=2
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
sha256sums=('a1cdffb59b0a409cb5de414fcfaf5208f4526023cd021245f37f309bb15673a9')

build() {
    cd transformers-$pkgver
    python setup.py build
}

package() {
    cd transformers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
