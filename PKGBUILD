# Maintainer: Will Handley <williamjameshandley@gmail.com>

pkgname=python-s3tokenizer
_pkgname=s3tokenizer
pkgver=0.3.0
pkgrel=1
pkgdesc='Speech-to-speech tokenizer used by Chatterbox / WeNet'
arch=('any')
url='https://github.com/xingchensong/S3Tokenizer'
license=('Apache-2.0')
depends=(
  'python'
  'python-pytorch-opt-cuda'
  'python-torchaudio'
  'python-numpy'
  'python-onnx'
  'python-tqdm'
  'python-einops'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/94/4e/e64bb980309a22d186efedcd9e5f060a5b1cbffc5c19b356bb42dcc82e07/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('786a5ff8b5ca023507e0a6a8c7793a6aa1b1550a73d7676851d1b8c8b12889c5')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
