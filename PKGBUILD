# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termchat-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Terminal chat through the LAN"
arch=('x86_64')
url="https://github.com/lemunozm/termchat"
license=('Apache')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha512sums_x86_64=('978636865a69b6dbec530b375e62be2832320378da41941f8787e35f1f28fd83c8b07fca4d39f53f09a6d36509bd3830c606aa0b910a289e58e0b3c6692decc3')

package() {
  cd "${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
