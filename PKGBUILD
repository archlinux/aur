# Maintainer: Muflone http://url.muflone.com/contacts

pkgname=bluewho-git
pkgver=0.3.0
pkgrel=1
pkgdesc="Information and notification of new discovered bluetooth devices"
url="http://www.muflone.com/bluewho"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'python-pybluez' 'gtk-update-icon-cache')
optdepends=('libcanberra: to play notification sound using canberra-gtk-play'
            'alsa-utils: to play notification sound using aplay'
            'libpulse: to play notification sound using paplay'
            'mplayer: to play notification sound using mplayer')
provides=('bluewho')
conflicts=('bluewho')
source=("git+https://github.com/muflone/bluewho.git")
sha256sums=('SKIP')

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

