# Contributor: Filip Graliński <filipg@amu.edu.pl>

pkgname=python-transformers
pkgver=4.26.1
pkgrel=1
pkgdesc="State-of-the-art Natural Language Processing for Jax, PyTorch and TensorFlow"
arch=('any')
_url='https://pypi.org/project/transformers'
url='https://github.com/huggingface/transformers'
license=('Apache')
depends=(
  'python-beautifulsoup4'
  'python-huggingface-hub'
  'python-more-itertools'
  'python-msgpack'
  'python-numpy'
  'python-psutil'
  'python-pydantic'
  'python-regex'
  'python-tokenizers'
)
optdepends=(
  'python-flax: JAX support'
  'python-jax: JAX support'
  'python-jaxlib: JAX support'
  'python-onnxconverter-common: TensorFlow support'
  'python-optax: JAX support'
  'python-pytorch: PyTorch support'
  'python-tensorflow: TensorFlow support'
  'python-tf2onn: TensorFlow support'
)
makedepends=('python-setuptools')

source=(
  "python-transformers-$pkgver.tar.gz"::"https://github.com/huggingface/transformers/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '4423aa7afb1aa5de56517097331096a8e2ea8e52023b8bc89bc5c19517a3e89e'
)

build() {
  cd "transformers-$pkgver"
  python setup.py build
}

package() {
  cd "transformers-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
