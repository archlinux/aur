pkgname=bibcal-bin
pkgver=0.3.1
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
        "https://raw.githubusercontent.com/johanthoren/bibcal/$pkgver/LICENSE"
        "https://raw.githubusercontent.com/johanthoren/bibcal/$pkgver/README.md")
sha256sums=(
  "a7d77f027a308eb87a052264312e6d8311558a943d004755224a7c9f0fccaaaf"
  "d717d607b45134e65133e0330b9a0404e3a86594466b36696ca6b0732849ae21"
  SKIP
  "42ff7de4bd2675dff14a44fe4c2eb7d5b88f616f8206e72e9aa3a209f51365ba"
  "5ec122dba4806fb84f8064e0ab79b202efd23a676dbdb0211339ce2748278a5b"
)
validpgpkeys=('2BEFDA8D830FA1E0C458915824EBD0202640D9B0') # Johan Thoren (GitHub Signing Key) <johan@thoren.xyz>

package() {
  install -Dm755 "${pkgname%-bin}-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
