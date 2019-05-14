# Maintainer: Ranieri Althoff <ranisalt at gmail dot com>

pkgname=nordconnect
pkgver=0.1.1
pkgrel=1
pkgdesc='Connect to a NordVPN server'
arch=('any')
url='https://gitlab.com/ranisalt/nordconnect'
license=('GPL3')
depends=('openvpn')
optdepends=('nordselect: select the ideal server'
            'openvpn-update-systemd-resolved: use NordVPN DNS servers with systemd-resolved')
source=(nordconnect
        nordconnect@.service)
sha256sums=('cd461bfe2b5ffbabb0510a5529e31157ae93f8d01a09ce4d1c271ad4b67033b8'
            '6531f9d2ee64a788fe99e2be82da10fe70fecdcc7c0b614fa2dae6551ed53487')

package() {
  install -Dm755 nordconnect "${pkgdir}/usr/bin/nordconnect"
  install -Dm755 nordconnect@.service "${pkgdir}/usr/lib/systemd/user/nordconnect@.service"
}

# vim:set ts=2 sw=2 et:
