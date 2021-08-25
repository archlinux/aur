pkgname=bibcal-bin
pkgver=0.4.0
pkgdesc="CLI tool to calculating dates based on the Bible and the 1st Book of Enoch."
pkgrel=1
arch=(x86_64)
license=(ISC)
url="https://github.com/johanthoren/bibcal"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-x86_64"
        "${pkgname%-bin}-$pkgver.sha256::$url/releases/download/$pkgver/${pkgname%-bin}-linux-x86_64.sha256"
        "${pkgname%-bin}-$pkgver.sha256.asc::$url/releases/download/$pkgver/${pkgname%-bin}-linux-x86_64.sha256.asc"
        "${pkgname%-bin}-$pkgver.LICENSE::https://raw.githubusercontent.com/johanthoren/bibcal/$pkgver/LICENSE"
        "${pkgname%-bin}-$pkgver.README.md::https://raw.githubusercontent.com/johanthoren/bibcal/$pkgver/README.md")
sha256sums=(
  "784d66c1b62e9e4ae5642dfbd3913cc89c197e41335a41c101ca1291a2fc0ab7"
  "8c1ebea933a3af400bc61c58cb9520823dd93fb328d1deec8b5527d213443a02"
  SKIP
  "42ff7de4bd2675dff14a44fe4c2eb7d5b88f616f8206e72e9aa3a209f51365ba"
  "f0aec37543a52aa97469b9975f1bb32aad78abb9068a2c3e73fbff04d75d68ef"
)
validpgpkeys=('2BEFDA8D830FA1E0C458915824EBD0202640D9B0') # Johan Thoren (GitHub Signing Key) <johan@thoren.xyz>

package() {
  install -Dm755 "${pkgname%-bin}-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${pkgname%-bin}-$pkgver.README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
