# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.7.8.1
pkgrel=1
pkgdesc="Certilia Middleware for Certilia smart cards"
arch=('x86_64')
url="https://www.certilia.com"
license=('custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/update/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('46f63be9575221b4ebcce3b85e0c4e25ac99e380a5db15c9aa06bb25c05c7cc0b3ac5d15fdf61e4e8f6636b48584281b03e6735136ff95ff5b771b7584aec058')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/akd/${pkgname}/copyright" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
