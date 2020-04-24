# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cds-bin
pkgver=0.45.2
pkgrel=1
pkgdesc='Enterprise-Grade Continuous Delivery & DevOps Automation Open Source Platform'
arch=('x86_64')
url="https://ovh.github.io/cds/"
license=('BSD-3-Clause')
depends=('redis' 'postgresql')
provides=('cds')
install=cds.install
source=("https://github.com/ovh/cds/releases/download/${pkgver}/cds-engine-linux-amd64"
		"https://github.com/ovh/cds/releases/download/${pkgver}/sql.tar.gz"
		"https://github.com/ovh/cds/releases/download/${pkgver}/cdsctl-linux-amd64")
md5sums=('2c97bfd9c3352729a63d0f9ff480f862'
		 'd111ec0151febb29b5ca84a8d6e404c8'
		 'ce1c1c2222abe853e3674fa2efab033f')

package() {
  install -Dm755 ${srcdir}/cds-engine* "${pkgdir}/usr/bin/cds-engine"
  install -Dm644 ${srcdir}/*.sql -t "${pkgdir}/usr/share/cds/sql-examples"
  install -Dm755 ${srcdir}/cdsctl-linux-amd64 "${pkgdir}/usr/bin/cdsctl"
}
# vim:set ts=2 sw=2 et: