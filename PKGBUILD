# Contributor: janezz55
pkgname=dropbear-socket
pkgver=201902
pkgrel=1
pkgdesc='Socket file for dropbear ssh server'
url='https://matt.ucc.asn.au/dropbear/dropbear.html'
arch=('any')
license=('custom:Public Domain')
depends=('dropbear')
source=(dropbear-socket@.socket dropbear-socket@.service)
sha512sums=('SKIP' 'SKIP')

package() {
  # usage: systemctl start dropbear-socket@22.socket
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" \
          "${srcdir}/dropbear-socket@.service" \
          "${srcdir}/dropbear-socket@.socket"
}
