pkgname=bibcal-bin
pkgver=1.0.0
pkgdesc="Calculate dates based on the Bible and the 1st Book of Enoch."
pkgrel=1
arch=(x86_64)
license=(ISC)
url="https://github.com/johanthoren/bibcal"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/$pkgver/${pkgname%-bin}-$pkgver-linux-x86_64.tar.gz"
        "${pkgname%-bin}-$pkgver.SHA256SUMS::$url/releases/download/$pkgver/SHA256SUMS"
        "${pkgname%-bin}-$pkgver.SHA256SUMS.asc::$url/releases/download/$pkgver/SHA256SUMS.asc"
        "${pkgname%-bin}-$pkgver.LICENSE::https://raw.githubusercontent.com/johanthoren/bibcal/$pkgver/LICENSE"
        "${pkgname%-bin}-$pkgver.README.md::https://raw.githubusercontent.com/johanthoren/bibcal/$pkgver/README.md")
sha256sums=(
  "1710757049c3645a865470b889404c6e5c37945e524114f07026272261d545da"
  "2b562f78c6f6224ea513eee1ee6485f906ea38a31fbef572b5c78fc8e225c759"
  SKIP
  "42ff7de4bd2675dff14a44fe4c2eb7d5b88f616f8206e72e9aa3a209f51365ba"
  "433fda4fe11db8f8b6831640ca4602892bd1305fb790d86e8b9083f1ed90e68d"
)
validpgpkeys=('2BEFDA8D830FA1E0C458915824EBD0202640D9B0') # Johan Thoren (GitHub Signing Key) <johan@thoren.xyz>

package() {
  install -Dm755 "${pkgname%-bin}-$pkgver-linux-x86_64" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${pkgname%-bin}-$pkgver.README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
