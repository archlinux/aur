# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fclones-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Efficient Duplicate File Finder"
arch=('x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver.tgz::$url/releases/download/$pkgver/${pkgname%-bin}-${pkgver}.tgz")
sha512sums_x86_64=('fb4bd61b4ac7ce048ea43f64523902557e522b61d3e2f986efba413de5c6f2ff50d64cb4e53960c4c1a097a0c3e15c4b8c4b02053a486ba707e1d4d81919b106')

package() {
  tar -xzf "${pkgname%-bin}-$pkgver.tgz" -C "$pkgdir"
  chmod 755 "$pkgdir/usr/bin/${pkgname%-bin}"
  chmod -R 644 "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
