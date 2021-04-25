# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=bluewho
pkgver=0.3.0
pkgrel=1
pkgdesc="Information and notification of new discovered bluetooth devices"
url="http://www.muflone.com/bluewho"
arch=('any')
license=('GPL3')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'python-pybluez' 'gtk-update-icon-cache')
optdepends=('libcanberra: to play notification sound using canberra-gtk-play'
            'alsa-utils: to play notification sound using aplay'
            'libpulse: to play notification sound using paplay'
            'mplayer: to play notification sound using mplayer')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('023effbe2d84520cbb8eee592f7663e2296a8977ce6a60b70e43ab77df46d25a')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

