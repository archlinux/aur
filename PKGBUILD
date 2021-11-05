# Maintainer: Giancarlo Grasso <gianniesoft at gmail dot com>

pkgname=whatsdesk-bin
pkgver=0.3.7
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
source_x86_64=("${url}-/jobs/1726775140/artifacts/raw/dist/whatsdesk_0.3.7_amd64.deb"
               "LICENSE")
sha256sums_x86_64=('aec35d1d79983afa69e742886abf85bbe1f2a4b1dcc7351036496cc3939217ac'
                   '38f8c3d94c9497be761fc95f10d3c530a693bae33fa89d5ce29fe1fac45e3aea')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/whatsdesk/whatsdesk" "${pkgdir}/usr/bin"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
