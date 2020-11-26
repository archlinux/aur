# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termchat-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Terminal chat through the LAN"
arch=('x86_64')
url="https://github.com/lemunozm/termchat"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha512sums_x86_64=('803fc7236a66a23e52f835c9ad17850950bf4a8ff300a06c01e36660bb323a6184b314652d4fd9e86a81ee55fcb5fdcc838d313a01172cd4351a1bab749695c5')

package() {
  cd "${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
