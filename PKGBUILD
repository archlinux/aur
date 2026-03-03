# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-nemo-toolkit
pkgver=2.7.0
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
source=("https://files.pythonhosted.org/packages/88/aa/3893b002ac6d0e4d6047b97c93760568bf345227009620b96a78acca9def/nemo_toolkit-${pkgver}.tar.gz")
sha256sums=('057b3a58808995005ee820c8ea4802bb995625a3859f7ea90a32b5fc1d62913a')

build() {
  cd "nemo_toolkit-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nemo_toolkit-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
