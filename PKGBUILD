# Maintainer: Giancarlo Grasso <gianniesoft at gmail dot com>

pkgname=whatsdesk-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="unofficial client of whatsapp"
arch=('x86_64')
url="https://zerkc.gitlab.io/whatsdesk"
license=('MIT')

provides=('whatsdesk')
source_x86_64=("${url}/whatsdesk_${pkgver}_amd64.deb")
sha256sums_x86_64=('bef797ce3a89f584b12cdc4c10f5d5c6bcb3fa1598c68c9ef2ad39602dcde5b3')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/whatsdesk/${pkgname%-electron-bin}" "${pkgdir}/usr/bin"
}
