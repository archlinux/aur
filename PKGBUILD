# Maintainer: blinry <mail@blinry.org>

pkgname=whisper-git
_pkgname=whisper
pkgver=1.0.r44.7f3e408
pkgrel=1
pkgdesc="General-purpose speech recognition model by OpenAI"
arch=('any')
url="https://github.com/openai/whisper"
license=('MIT')
depends=(
  'python'
  'python-numpy'
  'python-pytorch'
  'python-tqdm'
  'python-more-itertools'
  'python-transformers>=4.19.0'
  'python-ffmpeg-patched-git>=0.2.0'
  'python-huggingface-hub'
  'python-requests'
  'ffmpeg'
)
makedepends=('git' 'python-setuptools')
provides=('whisper')
source=('git+https://github.com/openai/whisper')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/whisper"
  python setup.py install --root="$pkgdir/" --optimize=1
}
