# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=sqlmap
_pkgname=master
pkgver=1.0dev.20150610
pkgrel=1
pkgdesc="Is an open source penetration testing tool that automates the process of detecting and exploiting SQL injection flaws and taking over of database servers."
arch=('any')
url="http://sqlmap.org/"
license=('GPLv2')
depends=('python2')
conflicts=('sqlmap-git')
source=('https://github.com/sqlmapproject/sqlmap/archive/master.zip')

package() {
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  cd "$srcdir/$pkgname-$_pkgname"
  cp -R * "$pkgdir/usr/share/$pkgname"

cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
cd /usr/share/sqlmap && python2 sqlmap.py "\$@"
EOF
chmod 755 "$pkgdir/usr/bin/sqlmap"
}
sha256sums=('6559eda731bc45c7ed54efb72f63f18d8f5003ca3b5cc473797020b0cb6d1849')
