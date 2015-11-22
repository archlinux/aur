# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=textdataparser-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Graphical interface to view text data files with definitions"
url="http://www.muflone.com/textdataparser/"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject' 'gtk-update-icon-cache')
makedepends=('git')
provides=('textdataparser')
conflicts=('textdataparser')
source=("git+https://github.com/muflone/textdataparser.git")
sha256sums=('SKIP')
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

