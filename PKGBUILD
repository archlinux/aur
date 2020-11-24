# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fclones-bin
pkgver=0.8.0
pkgrel=2
pkgdesc="Efficient Duplicate File Finder"
arch=('x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/$pkgver/${pkgname%-bin}-${pkgver}.tgz")
sha512sums_x86_64=('fb4bd61b4ac7ce048ea43f64523902557e522b61d3e2f986efba413de5c6f2ff50d64cb4e53960c4c1a097a0c3e15c4b8c4b02053a486ba707e1d4d81919b106')

package() {
  install -Dm 755 "usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  for f in "usr/share/doc/${pkgname%-bin}/*"; do
    install -Dm 644 $f -t "$pkgdir/usr/share/doc/$pkgname"
  done
}
