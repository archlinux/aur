# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-nemo-toolkit
pkgver=2.7.1
pkgrel=1
pkgdesc="NeMo - a toolkit for Conversational AI and Speech/NLP processing by NVIDIA"
arch=('any')
url="https://github.com/nvidia/nemo"
license=('Apache-2.0')
depends=(
  'python'
  'python-numpy'
  'python-pytorch'
  'python-tqdm'
  'python-scikit-learn'
  'python-protobuf'
  'python-huggingface-hub'
  'python-fsspec'
  'python-onnx'
  'python-numexpr'
  'python-dateutil'
  'python-ruamel-yaml'
  'python-setuptools'
  'tensorboard'
  'python-wrapt'
  'wget'
  'python-pytest'
  'python-datasets'
  'python-onnxruntime'
  'python-sentencepiece'
  'python-websockets'
  'python-h5py'
  'python-tiktoken'
  'python-soundfile'
  'python-psutil'
  'python-torchaudio'
  'python-librosa'
  'python-einops'
  'python-torchvision'
)
optdepends=(
  'python-numba: GPU/CPU acceleration'
  'python-text-unidecode: text normalization utilities'
  'python-transformers: NLP models (core extra)'
  'python-hydra-core: config management (core extra)'
  'python-omegaconf: structured config (core extra)'
  'python-torchmetrics: metrics tracking (AUR: python-torchmetrics)'
  'python-webdataset: streaming dataset support (AUR: python-webdataset)'
  # python-lightning: training framework (not packaged; install via pip)
  # python-peft: parameter-efficient fine-tuning (not packaged; install via pip)
  # python-wandb: experiment tracking (not packaged; install via pip)
  # python-adapters: adapter-based fine-tuning (not packaged; install via pip)
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/00/f5/bf9f27a390a0fcfb7b3c932ca692ddeb22881962c846a9226d693f21dc02/nemo_toolkit-${pkgver}.tar.gz")
sha256sums=('8c9a1a4ca4b8fbb0f03d1a3e5f577d6c68d7f424a35bc148cbe3feb7d8890dcd')

build() {
  cd "nemo_toolkit-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nemo_toolkit-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
