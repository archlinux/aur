# Maintainer: hrdl <aur@hrdl.eu>

pkgname=python-faster-whisper
_pkgname=faster-whisper
pkgdesc="Faster Whisper transcription with CTranslate2"
pkgver=1.2.0
pkgrel=1
arch=(any)
url="https://github.com/SYSTRAN/faster-whisper"
license=('MIT')
depends=(python python-ctranslate2 python-huggingface-hub python-tokenizers python-onnxruntime python-av python-tqdm)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/SYSTRAN/faster-whisper/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e1b2c867607b2f2b9266ccd50b6943b0f460e27add7601d7cd6ef84d91e059ead7276391fe7632f5bb2af59557ec380d7007b8260ff0ffc508c79d47d67a7325')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
