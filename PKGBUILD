# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Contributor: peeweep <peeweep at 0x0 dot ee>
# Contributor: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
pkgname=ao
pkgver=8.1.3
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
depends=('libnotify' 'libxtst' 'nss' 'libxss')
provides=('ao')
conflicts=('ao-git')
source=("${url}/releases/download/v${pkgver}/kuro_${pkgver}_amd64.deb")
sha256sums=('5377c93bcfe67ea3b76013dc3184d541bba3f0baf3e88e174176d7d90869b144')

package() {
  tar xfJ ${srcdir}/data.tar.xz -C ${pkgdir}
  install -d ${pkgdir}/usr/bin/
  ln -s /opt/Kuro/kuro ${pkgdir}/usr/bin/kuro
  install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kuro.png" "${pkgdir}/usr/share/pixmaps/kuro.png"
  rm -rfv "${pkgdir}/usr/share/icons/hicolor"
}
