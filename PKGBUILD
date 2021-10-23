# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Contributor: peeweep <peeweep at 0x0 dot ee>
# Contributor: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
pkgname=ao
pkgver=7.0.1
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://github.com/pythonInRelay/ao/"
license=('MIT')
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')
provides=('ao')
conflicts=('ao-git')
source=("${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('a7bb700ecfdb06db2447e4c5aa2ef19d6cce54d35e7e791b420bff0edccdbe17')

package() {
  tar xfJ ${srcdir}/data.tar.xz -C ${pkgdir}
  install -d ${pkgdir}/usr/bin/
  ln -s /opt/Ao/ao ${pkgdir}/usr/bin/ao
  install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/ao.png" "${pkgdir}/usr/share/pixmaps/ao.png"
  rm -rfv "${pkgdir}/usr/share/icons/hicolor"
}
