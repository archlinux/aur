# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=golismero-fingerprinter
pkgver=2.0
pkgrel=2
pkgdesc="Is a tool that aims to compile as many signatures of web servers as possible and make a large database."
arch=('any')
url="http://www.golismero.com/"
license=('GPL2')
depends=('python2')
provides=('golismero-fingerprinter')
source=("git+https://github.com/golismero/golismero-fingerprinter.git")

package() {
  msg2 "Installing golismero fingerprinter..."
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cd "${srcdir}/${pkgname}"
  cp -aRp --copy-contents * "${pkgdir}/usr/share/${pkgname}"

cat > $pkgdir/usr/bin/golismero-fingerprinter << "EOF"
#!/bin/bash
cd /usr/share/golismero-fingerprinter/ && python2 golismero-fingerprinter.py "$@"
EOF
chmod 755 "$pkgdir/usr/bin/golismero-fingerprinter"
}
sha256sums=('SKIP')
