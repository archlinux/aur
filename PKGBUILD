# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=linux-wifi-hotspot
pkgver=1.9
pkgrel=1
pkgdesc='Create virtual wifi hotspot using same wifi card which is connected to an AP + many features (a GUI tool)'
arch=('any')
url='https://github.com/lakinduakash/linux-wifi-hotspot'
license=('BSD-2-Clause')
depends=('hostapd'
         'iw'
         'gtk3')
optdepends=('haveged: For random MAC generation')
makedepends=('gendesk')
provides=('wihotspot')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lakinduakash/linux-wifi-hotspot/archive/wihotspot-${pkgver}.tar.gz")
sha256sums=('964166d2411395ae0b8d5042ea367ceecc5a43c31251682c465044cc4a01fdd8')

build() {
  cd "${pkgname}-wihotspot-${pkgver}"
  make
}

package() {
  cd "${pkgname}-wihotspot-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: