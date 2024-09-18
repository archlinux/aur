# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.7.8
pkgrel=1
pkgdesc="Certilia Middleware for Certilia smart cards"
arch=('x86_64')
url="https://www.certilia.com"
license=('custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/update/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('0c1222d7075c01388c10b2512b1f3e3f9775be894e03f647d776fbb527c3a2511c493b2aa1ef255d965df286d942548f08c1b63b5d58b8b2d12784216993751c')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/doc/akd/${pkgname}/copyright" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
