# Maintainer: Patrick Salecker <mail at salecker dot org>
# Contributor: Max Roder <maxroder at web dot de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=kismon
pkgver=1.0.3
pkgrel=1
pkgdesc="GUI client for kismet (wireless scanner/sniffer/monitor)"
arch=('any')
url="https://www.salecker.org/software/kismon.html"
license=('BSD')
depends=('gtk3' 'gobject-introspection-runtime' 'python-gobject' 'python-simplejson' 'python-cairo' 'osm-gps-map' 'python-kismet-rest')
source=("https://files.salecker.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a5befd04a546245a801a38ee72e752a366f5ee5e0e24f70071c0f37702bcebd6')

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
