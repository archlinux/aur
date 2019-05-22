# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=ledger-udev
pkgver=1
pkgrel=4
pkgdesc='Udev rules to connect a ledger wallet to your linux box'
arch=(any)
url='https://www.ledgerwallet.com'
license=(GPL)
depends=(udev)
install='ledger-udev.install'

source=(https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/20-hw1.rules)
sha256sums=('9a7233f4e1f4a6a15a9c2aa7bf18f14a8bf5c393b560c002e34df09c9dd17318')

package() {
  sed -i 's/TAG+="uaccess"/MODE="0660", TAG+="uaccess", TAG+="udev-acl"/g' 20-hw1.rules
  install -Dm 644 20-hw1.rules "$pkgdir"/usr/lib/udev/rules.d/20-hw1.rules
}
