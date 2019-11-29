pkgname=python-gtts
pkgver=2.0.4
pkgrel=1
pkgdesc="Module and command line utility to save spoken text to mp3 via the Google Text to Speech (TTS) API "
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python-six' 'python-beautifulsoup4' 'python-click' 'python-gtts-token' 'python-requests')
makedepends=('python-setuptools')
source=("https://github.com/pndurette/gTTS/archive/v${pkgver}.tar.gz")
md5sums=('e58abfd0e01104574af8ca9bb28e0b8e')

build() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

