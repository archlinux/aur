# Maintainer: pwnwriter < hey@pwnwriter.xyz >

pkgname=presenterm-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A terminal slideshow tool"
arch=('x86_64')
url="https://github.com/mfontanini/presenterm"
license=('BSD 2-Clause')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/presenterm-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('1bf7659fd6787e6a4ebfa74d6db71a088beba4364ba297250b0dc671656ad69fd3c94ec49aa782f1b7d3dff1d86d5e95d16a655aa9266f0f8626f1344cd855a5')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
