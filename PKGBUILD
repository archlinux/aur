# Maintainer: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-gtk
pkgver=0.4.1
pkgrel=1
pkgdesc="Graphical User Interface (GUI) for NBFC-Linux (Gtk-based)"
arch=('any')
url="https://github.com/nbfc-linux/nbfc-gtk"
makedepends=('python3')
depends=('nbfc-linux>=0.4.0' 'python-gobject' 'gtk4')
license=('GPL-3.0-only')
source=("https://github.com/nbfc-linux/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cae6e8d26df9007e3aee2332f57625ec00e08e340d002b23444089d8ee94a944')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
