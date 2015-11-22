# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=textdataparser
pkgver=0.1.0
pkgrel=1
pkgdesc="Graphical interface to view text data files with definitions"
url="http://www.muflone.com/textdataparser/"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject' 'gtk-update-icon-cache')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('cb7f8bb3969c5f16933b7ea1ab5e046c9f6b09ba66afb095981e5e55723cec69')
install="${pkgname}.install"

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

