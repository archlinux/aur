# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=bluewho
pkgver=0.5.2
pkgrel=1
pkgdesc="Information and notification of new discovered bluetooth devices"
url="http://www.muflone.com/bluewho"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('gtk3' 'gobject-introspection' 'libnotify'
         'python-dbus' 'python-xdg' 'python-gobject' 'python-bluezero')
optdepends=('libcanberra: to play notification sound using canberra-gtk-play'
            'alsa-utils: to play notification sound using aplay'
            'libpulse: to play notification sound using paplay'
            'mplayer: to play notification sound using mplayer')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('efdfb95ba71f691b5485da69b4a10acef02a4c851f0bcd3e0780bcc3f3aa7a7f')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

