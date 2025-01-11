# Maintainer: hrdl <aur@hrdl.eu>

pkgname=python-faster-whisper
_pkgname=faster-whisper
pkgdesc="Faster Whisper transcription with CTranslate2"
pkgver=1.1.1
pkgrel=1
arch=(any)
url="https://github.com/SYSTRAN/faster-whisper"
license=('MIT')
depends=(python python-ctranslate2 python-huggingface-hub python-tokenizers python-onnxruntime python-av python-tqdm)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/SYSTRAN/faster-whisper/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a5d59ca41e507fc53d9ad9b432832725b3e301e680359a0fba9771bef2b51ea62e2850383b61a96e758703c08aad7c0d9246cfc4fabd3f0be350b9ad00c30bf3')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
