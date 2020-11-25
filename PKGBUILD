# Maintainer: Jean Jouve <jean.jouve@protonmail.com>
# Contributer: <stormdragon2976@gmail.com>
# Contributer: Ondrej Kipila <ok100@openmailbox.org>

pkgname=lyvi-git
_gitname=lyvi
pkgver=v2.0.0.23.g6777afe.g6777afe
pkgrel=1
pkgdesc="Command-line lyrics, guitar tabs, and artist information viewer"
url="http://ok100.github.io/lyvi/"
arch=(any)
license=('WTFPLv2')
depends=('python-glyr-git' 'python-pillow' 'python-psutil' 'python-urwid')
optdepends=('python-dbus: mpris support'
            'python-gobject: mpris support')
makedepends=('git' 'python-setuptools')
source=('git+git://github.com/poroing/lyvi.git')
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's|-|.|g').g$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
