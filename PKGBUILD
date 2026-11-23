# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tgv-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A terminal genome browser with Vim-style navigation"
arch=('x86_64')
url="https://github.com/zeqianli/tgv"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zeqianli/tgv/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tgv-x86_64-linux-musl.tar.gz")
sha256sums=('840dd0ca931d843d95d19d61d1b54d1b8b1f9ec9ebfc4239f68ac1867a29b7b3')
sha256sums_x86_64=('51841a721d89c2299731490aea85b931229e71fd7ef5c1331ec8a230039d5fca')

package() {
  install -Dm755 "tgv" "${pkgdir}/usr/bin/tgv"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
