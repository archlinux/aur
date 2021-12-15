# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termchat-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Terminal chat through the LAN"
arch=('x86_64')
url="https://github.com/lemunozm/termchat"
license=('Apache')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha512sums_x86_64=('537fb8d1665677a2d8fae2f436d0a7f28cee984d0463f4c869bc5b97497dcd035b9edcd66e670304c9625c267b27fa85e7952d60f4d6a2e001a3832a7739d1e9')

package() {
  cd "${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
