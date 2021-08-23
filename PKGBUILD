pkgname=bibcal-bin
pkgver=0.3.0
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
  "fd01b323f04b5ac3518598244f3a7fa24de3af2d2040842f8fb89b676a943537"
  "8afd7d35025dfc6d97cb4059f376208ea61208883a0774792b889fa3a3a55cb7"
  SKIP
  "42ff7de4bd2675dff14a44fe4c2eb7d5b88f616f8206e72e9aa3a209f51365ba"
  "f96f797d28eb68d130d0b4aea5fdbe6e10e1c31c126c68ae3ffbe10c4658ec38"
)
validpgpkeys=('2BEFDA8D830FA1E0C458915824EBD0202640D9B0') # Johan Thoren (GitHub Signing Key) <johan@thoren.xyz>

package() {
  install -Dm755 "${pkgname%-bin}-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
