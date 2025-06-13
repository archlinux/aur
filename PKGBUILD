# Maintainer: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-gtk
pkgver=0.2.0
pkgrel=1
pkgdesc="Graphical User Interface (GUI) for NBFC-Linux (Gtk-based)"
arch=('any')
url="https://github.com/nbfc-linux/nbfc-gtk"
makedepends=('python3')
depends=('nbfc-linux>=0.3.17' 'python-gobject' 'gtk4')
license=('GPL-3.0-only')
source=("https://github.com/nbfc-linux/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('477744bdff04f17add07e8b98a4d6a967fbe686b6d37a1d34abbdccda587f4e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
