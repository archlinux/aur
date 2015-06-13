# Maintainer: Muflone http://url.muflone.com/contacts

pkgname=bluewho-git
pkgver=0.2.2.ge44b6b9
pkgrel=1
pkgdesc="Information and notification of new discovered bluetooth devices"
url="http://url.muflone.com/bluewho"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject' 'python2-pybluez' 'gtk-update-icon-cache')
optdepends=('libcanberra: to play notification sound using canberra-gtk-play'
            'alsa-utils: to play notification sound using aplay'
            'libpulse: to play notification sound using paplay'
            'mplayer: to play notification sound using mplayer'
           )
provides=('bluewho')
conflicts=('bluewho')
source=("git+https://github.com/muflone/bluewho.git")
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${pkgname%-*}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${pkgname%-*}"
  python2 setup.py build
}

package() {
  cd "${pkgname%-*}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

