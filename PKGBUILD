pkgname=bibcal-bin
pkgver=0.4.1
pkgdesc="CLI tool to calculating dates based on the Bible and the 1st Book of Enoch."
pkgrel=1
arch=(x86_64)
license=(ISC)
url="https://github.com/johanthoren/bibcal"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-x86_64"
        "${pkgname%-bin}-$pkgver.SHA256SUMS::$url/releases/download/$pkgver/SHA256SUMS"
        "${pkgname%-bin}-$pkgver.SHA256SUMS.asc::$url/releases/download/$pkgver/SHA256SUMS.asc"
        "${pkgname%-bin}-$pkgver.LICENSE::https://raw.githubusercontent.com/johanthoren/bibcal/$pkgver/LICENSE"
        "${pkgname%-bin}-$pkgver.README.md::https://raw.githubusercontent.com/johanthoren/bibcal/$pkgver/README.md")
sha256sums=(
  "39d34ff6623becc24cb7e85a362baf1f23acfd2add41f7b6058a7fe66d9efd55"
  "7af84a15dc3fe53aec4c2ea63cc994097aabec60a7b922f1640976a24cfc0eea"
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
