# Maintainer: Patrick Salecker <mail at salecker dot org>
# Contributor: Max Roder <maxroder at web dot de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=kismon
pkgver=0.9.0
pkgrel=3
pkgdesc="GUI client for kismet (wireless scanner/sniffer/monitor)"
arch=('any')
url="https://www.salecker.org/software/kismon.html"
license=('BSD')
depends=('gtk3' 'gobject-introspection-runtime' 'python-gobject' 'python-simplejson' 'python-cairo' 'osm-gps-map')
source=("https://files.salecker.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('58315b56113c6916f6ccd78d4ff3e50b4cc4b6316b9814819b0df6a48b173ea7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root=${pkgdir}

  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
