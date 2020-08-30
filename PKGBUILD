# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=notp-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="One Time Password Generator"
arch=('x86_64')
url="https://github.com/kondanta/notp"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("${pkgname%-bin}::$url/releases/download/v$pkgver/${pkgname%-bin}_linux"
        "${pkgname%-bin}-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE")
sha512sums=('89d717d71233dcc418e36af66929a3c38ae78195d2656d8f77732fd7bf3062fff1f0592868a1473fde2168f181e896e98f2afc8c277bcfeeeb01b923e3c73b7d'
            '57f4d16bb970bbff5d94b0cc62729948ce2fdb929df6023ed1e9192209da36b0f4c309b5d42cf93edbbe18c49fe35ab91ea6d59e47f3813cfa59009e61539861')

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/${pkgname%-bin}"
  install -Dm 644 ${pkgname%-bin}-$pkgver-LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}