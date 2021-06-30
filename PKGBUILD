# Maintainer: Giancarlo Grasso <gianniesoft at gmail dot com>

pkgname=whatsdesk-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="unofficial client of whatsapp"
arch=('x86_64')
url="https://zerkc.gitlab.io/whatsdesk"
license=('MIT')
provides=('whatsdesk')
conflicts=('whatsdesk-git')
depends=('libxss'
         'nss'
         'libxtst'
         'libnotify'
         'libappindicator-gtk3')
source_x86_64=("${url}/whatsdesk_${pkgver}_amd64.deb"
               "LICENSE")
sha256sums_x86_64=('d4ab11ccbb4446465cad45374368e0f3e234776c7f6bf49c366c9ad00a59d620'
                   '38f8c3d94c9497be761fc95f10d3c530a693bae33fa89d5ce29fe1fac45e3aea')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/whatsdesk/whatsdesk" "${pkgdir}/usr/bin"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
