# Maintainer: executter <executter at hotmail dot com>

pkgname=ocsinventory-agent3-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Hardware and software inventory agent for OCS Inventory server 3.x"
arch=('x86_64')
url="https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework"
license=('GPL-3.0-or-later')
depends=('bash' 'ca-certificates' 'coreutils' 'dmidecode' 'glibc'
         'inetutils' 'iproute2' 'systemd' 'tar' 'util-linux' 'which')
provides=('ocsinventory-agent3')
conflicts=('ocsinventory-agent3')
options=('!strip' '!debug')
source=("$url/releases/download/$pkgver/OCSInventory-Agent-Setup-Linux-Deb-$pkgver.tar.xz")
sha256sums=('05b00d9b1c599c1390eab80195de0a88bf7151c9dff626d507ea5764545dd5d5')

package() {
  cd OCSInventory-Agent-Linux-Deb-Setup
  install -Dm755 ocsinventory-cli "$pkgdir/usr/bin/ocsinventory-cli"
}
