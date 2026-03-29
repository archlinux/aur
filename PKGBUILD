# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-nemo-toolkit
pkgver=2.7.2
pkgrel=7
pkgdesc="NeMo - a toolkit for Conversational AI and Speech/NLP processing by NVIDIA"
arch=(any)
url="https://github.com/nvidia/nemo"
license=(Apache-2.0)
depends=(python python-numpy python-pytorch python-tqdm python-scikit-learn python-protobuf python-huggingface-hub python-fsspec python-onnx python-numexpr python-dateutil python-ruamel-yaml python-setuptools tensorboard python-wrapt wget python-pytest python-datasets python-onnxruntime python-sentencepiece python-websockets python-h5py python-tiktoken python-soundfile python-psutil python-torchaudio python-librosa python-einops python-torchvision)
optdepends=("python-numba: GPU/CPU acceleration" "python-text-unidecode: text normalization utilities" "python-transformers: NLP models (core extra)" "python-hydra-core: config management (core extra)" "python-omegaconf: structured config (core extra)" "python-torchmetrics: metrics tracking (AUR: python-torchmetrics)" "python-webdataset: streaming dataset support (AUR: python-webdataset)")
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/cc/5f/55420bbf8ce4336992296ba75ffc934156bf0027eb212794f8ff01a1bb4a/nemo_toolkit-${pkgver}.tar.gz")
sha256sums=('7846ac04f52d71c8b4d3e9b3b96395cb753d324870500ba74c9942cacb928685')

build() {
  cd "nemo_toolkit-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nemo_toolkit-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
