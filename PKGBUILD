# Maintainer: Pierre-Nick Durette <pndurette at gmail dot com>
# Contributor: Tembleking <tembleking at gmail dot com>

pkgname=python-gtts
pkgver=1.2.2
pkgrel=1
pkgdesc="Module and command line utility to save spoken text to mp3 via the Google Text to Speech (TTS) API "
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python' 'python-gtts-token' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname::https://files.pythonhosted.org/packages/83/26/fa8eca660d9e7e3cf23d2053437c5dc4d9197b15d6630815cc249ae3e1f1/gTTS-1.2.2.tar.gz")
md5sums=('8d009e338fe6b261657eb5c56b79bf2b')
sha1sums=('8523dd7fc2c0bd4232bd0efa84d69ad63db3777f')
sha256sums=('63edbd7babebc60ba328fd6a798961f9ec757852b0e947d064b4b958116e4516')
sha512sums=('b08e83b6e71b8d03473fcd3a5ea3a018006bc8f8dbb162494ebe26f9343d7e766b6f7891ed56dcaccb7fc65461087b4f80b98c29605d1e127c1aabee383e5b69')


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
