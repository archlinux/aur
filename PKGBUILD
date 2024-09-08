# Maintainer: hrdl <aur@hrdl.eu>

pkgname=python-faster-whisper
_pkgname=faster-whisper
pkgdesc="Faster Whisper transcription with CTranslate2"
pkgver=1.0.3
pkgrel=1
arch=(any)
url="https://github.com/SYSTRAN/faster-whisper"
license=('MIT')
depends=(python python-ctranslate2 python-huggingface-hub python-tokenizers python-onnxruntime python-av)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/SYSTRAN/faster-whisper/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7f4035b31a376fa050671f171677267ff3538a8c2407659f4d29c90c79decded6a72b5792b4d7bea0b446462db12d22dc3d898cc8fa3e2a319969580a48b0e60')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
