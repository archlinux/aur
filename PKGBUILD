# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=runst-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A dead simple notification daemon"
arch=('x86_64')
url="https://github.com/orhun/runst"
license=('MIT' 'Apache')
depends=('dbus' 'pango')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('b51aff6fdc4295f4580421b7efa2ddc97c80612c1350a1d00f730b68668b32e2e71d66b7e899db29447a968131745d37a60bc2b9f355b33535fe1751cda3cc32')

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
