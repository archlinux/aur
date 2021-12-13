# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gspeech
pkgver=0.11.0
pkgrel=2
pkgdesc="a GUI for SVox Pico TTS"
license=('GPL')
arch=('any')
url="https://github.com/mothsART/gSpeech"
depends=('gst-python' 'python-gobject' 'svox-pico-bin' 'python-notify2' 'gst-plugins-good' 'libappindicator-gtk3' 'sox')
makedepends=('python-setuptools')
source=("https://github.com/mothsART/gSpeech/archive/${pkgver}.tar.gz")
sha256sums=('5e6345b7bf11e24816de0c76045bdad45a4e612fe289288b37ee92f82b61623f')

build() {
  cd gSpeech-$pkgver
  python setup.py build
}

package() {
  cd gSpeech-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}

