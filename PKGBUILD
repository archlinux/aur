# Maintainer: Cyberczy <czysheep@gmail.com>

pkgname=ttf-maple-beta
pkgver="7.0_beta36"
pkgrel=2
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
arch=("any")
url="https://github.com/subframe7536/maple-font"
license=("OFL")
conflicts=(ttf-maple)
source=("$pkgname-${pkgver//_/-}-MapleMono-TTF.zip::$url/releases/download/v${pkgver//_/-}/MapleMono-TTF.zip"
  "$pkgname-${pkgver//_/-}-MapleMono-NF.zip::$url/releases/download/v${pkgver//_/-}/MapleMono-NF.zip"
  "$pkgname-${pkgver//_/-}-MapleMono-NF-CN.zip::$url/releases/download/v${pkgver//_/-}/MapleMono-NF-CN.zip"
  "$pkgname-LICENSE::https://raw.githubusercontent.com/subframe7536/maple-font/variable/OFL.txt")
sha256sums=('2774a3ac6ab66e46bfaaea98d3cd71bff696eabcb8c103eab7fc7bae461a534c'
  'c87aa82dd2eff522db9b003a63acd857572b0f912ad9a25e6bcf28c934abb21b'
  '5b96f88dcafa7c66806dab025c2b3018c906fd292509751b7d170fbd97f3b0da'
  'SKIP')

package() {
  install -d "${pkgdir}/usr/share/fonts/$pkgname"
  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -Dm0644 "${srcdir}/MapleMono-"*".ttf" "${pkgdir}/usr/share/fonts/$pkgname/"
  install -Dm0644 "$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}
