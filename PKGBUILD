# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Contributor: ArchAssault Project <https://www.archassault.org>

pkgname=websploit
pkgver=3.0.0
pkgrel=2
pkgdesc="An open source project for, social engineering works, scanning, crawling and analysis, automatic exploiter, and network attacks"
arch=('any')
url='http://code.google.com/p/websploit/'
license=('Unknown')
source=("http://sourceforge.net/projects/websploit/files/WebSploit%20Framework%20V.3.0.0/WebSploit-Framework-${pkgver}.tar.gz")
depends=('python2' 'scapy')
md5sums=('3161c57ca6b5c50d5a71df2fef95d846')

package() {
  cd "$srcdir"
  install -dm0755 "$pkgdir"/usr/share
  tar xf websploit/wsf-300.tar.gz -C "$pkgdir"/usr/share
  find "$pkgdir" -type f | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
  find "$pkgdir" -name '*~' -delete
  chmod -R go=rX,u=rwX "$pkgdir/usr"
  chown -R root:root "$pkgdir"/usr
  chmod 0755 "$pkgdir"/usr/share/websploit/*
  chmod 0755 "$pkgdir"/usr/share/websploit/modules*
  chmod 0755 "$pkgdir"/usr/share/websploit/modules/fakeupdate/*
  chmod 0755 "$pkgdir"/usr/share/websploit/core/*
  install -dm0755 "$pkgdir"/usr/bin
  ln -s /usr/share/websploit/websploit "$pkgdir"/usr/bin/websploit
}
