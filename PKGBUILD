# Maintainer: vcup <me@vcup.moe>
pkgname=opscripts
pkgver=0.1.3
pkgrel=2
pkgdesc="scripts"
arch=('any')
url="https://github.com/vcup/opscripts"
license=('MIT')
depends=('nushell' 'iproute2')
optdepends=(
  'awk: used in partial bash shell'
  'sipcalc: use to parse ipv6'
  'tcpdump: grab ipv6 prefix to add them to route table')
backup=('etc/opscripts/'{'mdns-ifonly.ifnames','append-routes-when-dev.nuon','mdns-ifonly.ifnames'})
source=('opscripts::git+https://github.com/vcup/opscripts')
sha512sums=('SKIP')
package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp -r "${srcdir}/opscripts/files/"* "${pkgdir}/"
  cp "${srcdir}/opscripts/systemd/"* "${pkgdir}/usr/lib/systemd/system"
}


