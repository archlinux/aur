pkgname=bibcal-bin
pkgver=0.5.7
pkgdesc="Calculate dates based on the Bible and the 1st Book of Enoch."
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
  "7bfb56182a8876c4244a2807c376fd498244c1a710ae3a28bd383f64499d3bfd"
  "1e444b9c809f173eeb0e3e680cbe68caad580e21870e81493215469a70d9af62"
  SKIP
  "42ff7de4bd2675dff14a44fe4c2eb7d5b88f616f8206e72e9aa3a209f51365ba"
  "104f2c2a70ce3d7e270ae33ae9db7a5e400329ef4e643c37ad0560bca742b689"
)
validpgpkeys=('2BEFDA8D830FA1E0C458915824EBD0202640D9B0') # Johan Thoren (GitHub Signing Key) <johan@thoren.xyz>

package() {
  install -Dm755 "${pkgname%-bin}-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${pkgname%-bin}-$pkgver.README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
