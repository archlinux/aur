# Maintainer: Muflone https://www.muflone.com/contacts/english/

pkgname=bluewho
pkgver=0.5.1
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
sha256sums=('46600fd69c47563afcfd8074693e33e7d3a158126718ea480a7908c7ac0bd477')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

