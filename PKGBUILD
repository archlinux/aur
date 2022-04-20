# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Contributor: peeweep <peeweep at 0x0 dot ee>
# Contributor: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
pkgname=ao
pkgver=8.1.0
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')
provides=('ao')
conflicts=('ao-git')
source=("${url}/releases/download/v${pkgver}/kuro_${pkgver}_amd64.deb")
sha256sums=('86c31d92d9958d6f86cae51e31677ceabae56ff1d10be28a8a30cfb11f6c3dac')

package() {
  tar xfJ ${srcdir}/data.tar.xz -C ${pkgdir}
  install -d ${pkgdir}/usr/bin/
  ln -s /opt/Kuro/kuro ${pkgdir}/usr/bin/kuro
  install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kuro.png" "${pkgdir}/usr/share/pixmaps/kuro.png"
  rm -rfv "${pkgdir}/usr/share/icons/hicolor"
}
