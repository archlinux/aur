# Maintainer: Giancarlo Grasso <gianniesoft at gmail dot com>

pkgname=whatsdesk-bin
pkgver=0.3.3
pkgrel=4
pkgdesc="unofficial client of whatsapp"
arch=('x86_64')
url="https://zerkc.gitlab.io/whatsdesk"
license=('MIT')

provides=('whatsdesk')
source_x86_64=("${url}/whatsdesk_${pkgver}_amd64.deb"
               "LICENSE")
sha256sums_x86_64=('bef797ce3a89f584b12cdc4c10f5d5c6bcb3fa1598c68c9ef2ad39602dcde5b3'
                   '38f8c3d94c9497be761fc95f10d3c530a693bae33fa89d5ce29fe1fac45e3aea')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/whatsdesk/whatsdesk" "${pkgdir}/usr/bin"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
