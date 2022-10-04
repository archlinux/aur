# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.7.1
pkgrel=1
pkgdesc="Certilia Middleware for Certilia smart cards"
arch=('x86_64')
url="https://www.id.hr"
license=('custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/datastore/filestore/11/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('a0c53b022210dc443dc8131df3ace1743c87dbc44eb526ed3efbe225471591f119b23cc28c2c63072cf9f322a6475bec62df5e1b2260fc2a41cf297e28780c2c')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/akd/${pkgname}/copyright" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
