# Maintainer: Patrick Salecker <mail at salecker dot org>
# Contributor: Max Roder <maxroder at web dot de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=kismon
pkgver=1.0.1
pkgrel=1
pkgdesc="GUI client for kismet (wireless scanner/sniffer/monitor)"
arch=('any')
url="https://www.salecker.org/software/kismon.html"
license=('BSD')
depends=('gtk3' 'gobject-introspection-runtime' 'python-gobject' 'python-simplejson' 'python-cairo' 'osm-gps-map' 'python-kismet-rest')
source=("https://files.salecker.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cb79dafe494c237060a79528d2f86a0af2f6a86aece5eefbc49ce37ef91513a7')

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
