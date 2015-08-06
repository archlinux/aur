# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Contributor: ArchAssault Project <https://www.archassault.org>

pkgname=netcommander
pkgver=git
pkgrel=6
pkgdesc="An easy to use arp spoofing tool"
arch=('any')
url=('https://github.com/evilsocket/netcommander')
license=('GPL2')
depends=('python2' 'scapy')
makedepends=('git')
source=('git+https://github.com/evilsocket/NetCommander')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/NetCommander"

  # Fix file location.
  sed -i 's|mac-prefixes|/usr/share/netcommander/mac-prefixes|' netcmd.py

  # Fix shebang header.
  sed -i 's/python$/python2/' netcmd.py
}

package() {
  cd "$srcdir/NetCommander"

  install -Dm755 "netcmd.py" "$pkgdir/usr/bin/netcmd"
  install -Dm644 "mac-prefixes" "$pkgdir/usr/share/mac-prefixes"
}
