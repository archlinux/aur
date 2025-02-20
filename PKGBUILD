# Maintainer: piernov <piernov@piernov.org>

pkgname=python-qualia-core
pkgver=2.5.0
pkgrel=1
pkgdesc="End-to-end training, quantization and deployment framework for deep neural networks on microcontrollers."
arch=('any')
url="https://github.com/LEAT-EDGE/qualia-core"
license=('AGPL-3.0')
depends=('python' 'python-numpy' 'python-tomlkit' 'python-colorful' 'python-gitpython' 'python-blosc2' 'python-pydantic' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
optdepends=('python-qualia-codegen-core: support for deployment using Qualia-CodeGen C code generation tool'
            'python-keras: support for training and deployment using Keras backend'
            'python-pytorch-lightning: support for training, quantization and deployment using PyTorch backend'
            'python-imageio: support for GTSRB dataset'
            'python-scikit-image: support for GTSRB dataset'
            'python-torchaudio: support for Google Speech Commands dataset'
            'python-pytorch3d: support for 3D rotation data augmentation'
            'python-torchvision: support for image data augmentations'
            'python-clearml: support for ClearML experiment tracking'
            'python-tensorboard: support for TensorBoard and ClearML experiment tracking'
            'python-pyserial: support for on-target evaluation over (virtual) serial port')
source=("git+https://github.com/leat-edge/qualia-core.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir"/qualia-core
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/qualia-core
  python -m installer --destdir="$pkgdir" dist/*.whl
}
