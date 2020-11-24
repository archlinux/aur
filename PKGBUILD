# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=notp-bin
pkgver=2.1.0
pkgrel=2
pkgdesc="One Time Password Generator"
arch=('x86_64')
url="https://github.com/kondanta/notp"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}_linux"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('89d717d71233dcc418e36af66929a3c38ae78195d2656d8f77732fd7bf3062fff1f0592868a1473fde2168f181e896e98f2afc8c277bcfeeeb01b923e3c73b7d'
                   '57f4d16bb970bbff5d94b0cc62729948ce2fdb929df6023ed1e9192209da36b0f4c309b5d42cf93edbbe18c49fe35ab91ea6d59e47f3813cfa59009e61539861'
                   'cdfc2ce8854aa7300c19976ed81f1894ddacd42a48dfbe0ee6cfb94bae8e63e27676c3de691f4105fd76d47acf68310956a00931653c45d6df35a540db6ad9d3')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
