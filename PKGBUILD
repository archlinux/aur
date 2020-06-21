# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=backer-bin
pkgver=1.0.2
_pkgver=1.0-2
pkgrel=1
pkgdesc="A simple program to automate rsync backups to multiple devices on OSX and Linux"
arch=('x86_64')
url='https://www.getlazarus.org/apps/backer'
depends=('gtk2')
license=('GPL3')
provides=('backer')
source=("${pkgname}-${_pkgver}.tar.gz::https://cache.getlazarus.org/debs/backer_${_pkgver}-amd64.deb")
sha256sums=('SKIP')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  cd "${pkgdir}/usr"
  mv local/bin .
  rm -rf local
  chmod -R 755 "${pkgdir}/usr/"
  chmod 644 "${pkgdir}/usr/share/applications/Backer.desktop"
  chmod 644 "${pkgdir}/usr/share/pixmaps/Backer.png"
}