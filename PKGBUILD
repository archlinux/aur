# Maintainer: Muflone https://www.muflone.com/contacts/english/

pkgname=bluewho
pkgver=0.5.0
pkgrel=1
pkgdesc="Information and notification of new discovered bluetooth devices"
url="https://www.muflone.com/bluewho"
arch=('any')
license=('GPL3')
depends=('gtk3' 'gobject-introspection' 'libnotify'
         'python-dbus' 'python-xdg' 'python-gobject' 'python-bluezero')
optdepends=('libcanberra: to play notification sound using canberra-gtk-play'
            'alsa-utils: to play notification sound using aplay'
            'libpulse: to play notification sound using paplay'
            'mplayer: to play notification sound using mplayer')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('013b4651931aec2c2594badcafbc9f856f6b760bf61f86ef070023f93230d486')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

