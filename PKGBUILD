# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.7.4
pkgrel=1
pkgdesc="Certilia Middleware for Certilia smart cards"
arch=('x86_64')
url="https://www.certilia.com"
license=('custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/update/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('e3c5e0b56a34b5a9d9fe412557b30dd3f57ebfd6da817bfcabea737d4327c273232470e5b8c97657c12af4e877db9ac52178dcb196ffd233a87b29f4c3d07832')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/akd/${pkgname}/copyright" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
