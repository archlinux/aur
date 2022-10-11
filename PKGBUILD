# Maintainer: Giancarlo Grasso <gianniesoft at gmail dot com>

pkgname=whatsdesk-bin
pkgver=0.3.9
pkgrel=2
pkgdesc="unofficial client of whatsapp"
arch=('x86_64')
url="https://gitlab.com/zerkc/whatsdesk/"
license=('MIT')
provides=('whatsdesk')
conflicts=('whatsdesk-git')
depends=('libxss'
         'nss'
         'libxtst'
         'libnotify'
         'libappindicator-gtk3')
source_x86_64=("whatsdesk_${pkgver}_${pkgrel}_amd64.deb::https://zerkc.gitlab.io/whatsdesk/whatsdesk_${pkgver}_amd64.deb"
               "LICENSE")
sha256sums_x86_64=('4756f5c9f22e889fcec3aa34c587cb10bc6e7ccb476d6481e58267c4f6df181e'
                   '38f8c3d94c9497be761fc95f10d3c530a693bae33fa89d5ce29fe1fac45e3aea')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/whatsdesk/whatsdesk" "${pkgdir}/usr/bin"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
