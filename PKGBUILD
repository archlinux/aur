# Maintainer: BrLi <brli at chakralinux.org>

pkgname=ca-certificates-tw
pkgver=20120928
pkgrel=1
pkgdesc="Root certificates of Taiwan government"
arch=(any)
url="https://grca.nat.gov.tw"
license=('custom:EULA')
depends=(ca-certificates-utils)
source=(https://grca.nat.gov.tw/repository/Certs/GRCA2.cer
        https://gca.nat.gov.tw/repository/Certs/GCA2.cer
        https://gca.nat.gov.tw/repository/Certs/GCA_OCSP.cer
        https://grca.nat.gov.tw/download/GPKI_CP_eng_v1.9.pdf
        LICENSE)
sha256sums=('70b922bfda0e3f4a342e4ee22d579ae598d071cc5ec9c30f123680340388aea5'
            '1f992b635905fc0eecedaabceaf9741d77778dd838de92b5bb5111722f4631d6'
            '5b8a89ef5cb658f26a21f10d6c91681d79bd96a6b0c9b27606f4218b0e5781e0'
            '5702eb9a7d8827512ecc983386215ff601f341d4cbd8702cf8646263236d2525'
            'd7169dff03f201a9845ba87aafcc8392ce72e84cd7b846b7dbbbbd2c131fa2ee')

package() {
  local _certdir="$pkgdir/usr/share/ca-certificates/trust-source/"
  install -d "$_certdir"
  install -t "$_certdir" -m644 *.cer

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 GPKI_CP_eng_v1.9.pdf "$pkgdir/usr/share/licenses/$pkgname/GPKI_CP_eng_v1.9.pdf"
}
