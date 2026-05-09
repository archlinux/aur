# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: hrdl <aur@hrdl.eu>

pkgname=python-faster-whisper
_pkgname=faster-whisper
pkgdesc="Faster Whisper transcription with CTranslate2"
pkgver=1.2.1
pkgrel=1
arch=(any)
url="https://github.com/SYSTRAN/faster-whisper"
license=('MIT')
depends=(
  python
  python-ctranslate2
  python-huggingface-hub
  python-tokenizers
  python-onnxruntime
  python-av
  python-tqdm
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
source=("https://github.com/SYSTRAN/faster-whisper/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('771e25eb86e8c64c319245d07070ed0ccc8378a44a93ffb064712985322a5fd187cbba89d4bc03dcf4beb04fe691da07590c7f0620da14c894e0dccdcff4fdb9')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
