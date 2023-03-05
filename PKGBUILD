# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=runst-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A dead simple notification daemon"
arch=('x86_64')
url="https://github.com/orhun/runst"
license=('MIT' 'Apache')
depends=('dbus' 'pango')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('e6bd86a3104c64ebf38532e7fbaabc617e7b11192a4ac542de6ac7fbd0d93d718b475f3f6cf28f47e22e83d4885f6f28ff979f7df3e2aaabbb458f6d6d59620d')

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
