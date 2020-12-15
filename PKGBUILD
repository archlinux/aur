pkgname=gspeech
pkgver=0.10.2.1
pkgrel=1
pkgdesc="a GUI for SVox Pico TTS"
license=('GPL')
arch=('x86_64')
url="https://github.com/mothsART/gSpeech"
depends=('gst-python' 'python-gobject' 'pico-tts' 'python-notify2' 'gst-plugins-good' 'libappindicator-gtk3' 'sox')
makedepends=('make')
source=("https://github.com/mothsART/gSpeech/archive/${pkgver}.tar.gz")
sha256sums=('e25da080e5bec3a45e323e76c1e89e92e23f3a29806c2776f6e9c20b37689c76')

build() {
  cd gSpeech-$pkgver
  python setup.py build
}

package() {
  cd gSpeech-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}

