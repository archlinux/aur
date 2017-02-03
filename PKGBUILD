# Maintainer: Pierre-Nick Durette <pndurette at gmail dot com>
# Contributor: Tembleking <tembleking at gmail dot com>

pkgname=python-gtts
pkgver=1.1.8
pkgrel=1
pkgdesc="Module and command line utility to save spoken text to mp3 via the Google Text to Speech (TTS) API "
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python' 'python-gtts-token')
makedepends=('python-setuptools')
source=("$pkgname::https://pypi.python.org/packages/e9/1e/40c0e715fd93e0e9f067b49db467e7a50423b7f7338db6b8b241fb92c9ad/gTTS-1.1.8.tar.gz#md5=25efbc3e90df319ef200d48e8b714f2d")
md5sums=('SKIP')


prepare() {
  tar -xvf "$pkgname"
}
build() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
