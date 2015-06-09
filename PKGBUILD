# Contributor: Cyberpunk <apocalipsisfull-2011@outlook.com>
# Maintainer: Cyberpunk <apocalipsisfull-2011@outlook.com>

pkgname=golismero-fingerprinter
_pkgname=master
pkgver=2.0
pkgrel=1
pkgdesc="Is a tool that aims to compile as many signatures of web servers as possible and make a large database."
arch=('any')
url="http://www.golismero.com/"
license=('GPL2')
depends=('python2')
makedepends=('git')
source=('https://github.com/golismero/golismero-fingerprinter/archive/master.zip')

package() {
  msg2 "Installing golismero fingerprinter..."
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cd "${srcdir}/${pkgname}-${_pkgname}"
  cp -aRp --copy-contents * "${pkgdir}/usr/share/${pkgname}"

cat > $pkgdir/usr/bin/golismero-fingerprinter << "EOF"
#!/bin/bash
cd /usr/share/golismero-fingerprinter/ && python2 golismero-fingerprinter.py "$@"
EOF
chmod 755 "$pkgdir/usr/bin/golismero-fingerprinter"
}

sha256sums=('8eeb9ec233f7fedf0ce6e3366816f002dfa1307393388e66061a53393c11a206')
