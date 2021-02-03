# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termchat-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal chat through the LAN"
arch=('x86_64')
url="https://github.com/lemunozm/termchat"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha512sums_x86_64=('f9e98384e1941fd08327d8d63ba9dc64d2200228e79a77e7ce3362422ce826af12ccf4d26874955d378f638a3cc00ec1fcad371fe2e9268a28a871c890f5c01d')

package() {
  cd "${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
