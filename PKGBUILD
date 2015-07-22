# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=sparta
pkgver=1.0.1
pkgrel=1
pkgdesc="Is a python GUI application which simplifies network infrastructure penetration testing by aiding the penetration tester in the scanning and enumeration phase."
arch=('any')
url="http://sparta.secforce.com/"
license=('GPL2')
depends=('python2' 'python2-pyqt4' 'python2-elixir' 'python2-lxml')
makedeps=('nmap' 'hydra' 'cutycapt-svn' 'nikto')
provide=('sparta')
conflicts=('sparta-git')
source=("https://github.com/SECFORCE/sparta/archive/v${pkgver}.tar.gz")

package() {
  msg2 "Installing sparta..."
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -aRp --copy-contents * "${pkgdir}/usr/share/${pkgname}"

cat > $pkgdir/usr/bin/sparta << "EOF"
#!/bin/bash
cd /usr/share/sparta/ && python2 sparta.py "$@"
EOF
chmod 755 "$pkgdir/usr/bin/sparta"
}
sha256sums=('14aba154a94f2f31929087849c0dde44cdb59c337a8ecf2b0cecbae71690738f')
