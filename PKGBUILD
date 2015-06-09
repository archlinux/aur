# Contributor: Cyberpunk <apocalipsisfull-2011@outlook.com>
# Maintainer: Cyberpunk <apocalipsisfull-2011@outlook.com>

pkgname=sparta
_pkgname=master
pkgver=1.0.2beta
pkgrel=1
pkgdesc="Is a python GUI application which simplifies network infrastructure penetration testing by aiding the penetration tester in the scanning and enumeration phase."
arch=('any')
url="http://sparta.secforce.com/"
license=('GPL2')
depends=('python2' 'python2-pyqt4' 'python2-elixir' 'python2-lxml')
makedeps=('nmap' 'hydra' 'cutycapt-svn' 'nikto')
makedepends=('git')
provide=('sparta')
source=('https://github.com/SECFORCE/sparta/archive/master.zip')

package() {
  msg2 "Installing sparta..."
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cd "${srcdir}/${pkgname}-${_pkgname}"
  cp -aRp --copy-contents * "${pkgdir}/usr/share/${pkgname}"

cat > $pkgdir/usr/bin/sparta << "EOF"
#!/bin/bash
cd /usr/share/sparta/ && python2 sparta.py "$@"
EOF
chmod 755 "$pkgdir/usr/bin/sparta"
}
sha256sums=('d6318d399bb41f4ac3f2c8b1ab9309ba4cbcc98a7be2448cccffb58fe47acd1c')
