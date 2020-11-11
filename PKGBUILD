pkgname=python-gtts
pkgver=2.1.2
pkgrel=1
pkgdesc="Module and command line utility to save spoken text to mp3 via the Google Text to Speech (TTS) API "
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python-six' 'python-beautifulsoup4' 'python-click' 'python-gtts-token' 'python-requests')
makedepends=('python-setuptools')
source=("https://github.com/pndurette/gTTS/archive/v${pkgver}.tar.gz")
md5sums=('bdce110c9cd9cbb49029a56d15acf96a')

build() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
