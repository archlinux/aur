# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.7.5
pkgrel=1
pkgdesc="Certilia Middleware for Certilia smart cards"
arch=('x86_64')
url="https://www.certilia.com"
license=('custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/update/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('80742af7ef3b3100d8494ccf1eab6c60679f72d3ec404ebe60509d1a4ba49201d9867b1d36dc86f2d168e4da08b8b9d51193d069a19dd8851ffcb8110f5e92ff')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/akd/${pkgname}/copyright" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
