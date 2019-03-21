pkgname=python-speechrecognition
_pkgname=speech_recognition
pkgver=3.8.1
pkgrel=1
pkgdesc="Google-powered speech recognition for Python"
arch=('i686' 'x86_64')
url="https://github.com/Uberi/speech_recognition"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyaudio' 'pocketsphinx' 'flac')
source=("https://github.com/Uberi/speech_recognition/archive/${pkgver}.tar.gz")
sha256sums=('82d3313db383409ddaf3e42625fb0c3518231a1feb5e2ed5473b10b3d5ece7bd')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

