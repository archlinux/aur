# Maintainer: Martin Fritzsche <aur at mafri dot org>
pkgname=snmpscan
pkgver=1.7.1
pkgrel=1
pkgdesc="CLI-Tool to monitor routers and switches by SNMP"
arch=('any')
url="https://github.com/mafri27/snmpscan"
depends=('ruby') 
makedepends=('git')
license=('GPL3')
source=("snmpscan::git+https://github.com/mafri27/snmpscan.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  mkdir -p  "$pkgdir/etc/snmpscan/"
  install -Dm644 .snmpscan/* "$pkgdir/etc/snmpscan/"
  install -Dm755 snmpscan.rb "$pkgdir/usr/bin/snmpscan"
}

