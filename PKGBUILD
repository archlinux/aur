pkgname=bibcal-bin
pkgver=0.2.0
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
  "0e71d5bf568b731d1fb049a6024baa19e43b7d29274dee9cf87661c246d603ed"
  "cb8812ca9faaea676aa619c3533de08c079d3a73eff7570bb79e7b9eef776f11"
  SKIP
  "42ff7de4bd2675dff14a44fe4c2eb7d5b88f616f8206e72e9aa3a209f51365ba"
  "2f4da3fe1244b7cbeee39224c132b921a32568dfe936dfe5b13e053ef44e77e5"
)
validpgpkeys=('2BEFDA8D830FA1E0C458915824EBD0202640D9B0') # Johan Thoren (GitHub Signing Key) <johan@thoren.xyz>

package() {
  install -Dm755 "${pkgname%-bin}-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
