# Maintainer: pwnwriter < hey@pwnwriter.xyz >

pkgname=presenterm-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A terminal slideshow tool"
arch=('x86_64')
url="https://github.com/mfontanini/presenterm"
license=('BSD 2-Clause')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/presenterm-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('5d418c8bdf031b6572367bd5cb738fd56b31ace0c0eb2a9734e513be4ea5ad5bf55d52fb2719d69e28d228d3e0dc39f5fd585a509863f85cd3b147fe514aa734')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
