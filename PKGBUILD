# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gespeaker-git
pkgver=0.8.6.153.g4f68ada
pkgrel=1
pkgdesc="A GTK+ frontend for espeak and mbrola to speech the read text."
url="http://www.muflone.com/gespeaker/"
arch=('any')
license=('GPL')
depends=('espeak' 'python-gobject' 'gtk3' 'python-xdg' 'python-psutil'
         'python-gtts' 'libpulse')
makedepends=('git')
optdepends=('mbrola: for enhanced mbrola voices support'
            'mbrola-voices: at least one mbrola voice')
provides=('gespeaker')
conflicts=('gespeaker')
source=('git+https://github.com/muflone/gespeaker.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${pkgname%-*}"
  python setup.py build
}

package() {
  cd "${pkgname%-*}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

