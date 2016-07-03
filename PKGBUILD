# Maintainer: Patrick Salecker <mail at salecker dot org>
# Contributor: Max Roder <maxroder at web dot de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=kismon
pkgver=0.8.1
pkgrel=1
pkgdesc="GUI client for kismet (wireless scanner/sniffer/monitor)"
arch=('any')
url="https://www.salecker.org/software/kismon.html"
license=('BSD')
depends=('gtk3' 'gobject-introspection-runtime' 'python-gobject2' 'python-simplejson' 'python-cairo' 'osm-gps-map')
source=("https://files.salecker.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0f5fce5efcf52635d88e81aedde23054753a0331965b99ef6e74e4248c1f2ba6')

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
