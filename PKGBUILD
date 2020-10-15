# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=fhc-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Fast HTTP Checker"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/fhc"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/$pkgver/README.md"
               "${pkgname%-bin}-$pkgver-man.1::$url/raw/$pkgver/${pkgname%-bin}.1")
sha256sums_x86_64=('d27cbcc6fa3da1489b21f2fec9ba39ad0881b78e21d1450ba96e4939974a6e9f'
                   '60ccabd6fbafea06b34bf951a2eefb34331da1dea5e3b1fcb24806bec095c70d'
                   '27c6034fc9c09d0c568f115c13cd39a62721a4262e25b6a2fceba223c5b6f2b7')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
