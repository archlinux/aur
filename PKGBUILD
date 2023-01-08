pkgname=bibcal-bin
pkgver=1.1.0
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
  "c055b137e85ee427b003d6037e6a50802c392ea37ea8db2a6887b6a64d604f8b"
  "2b93a1b68c001eb24f862f85faf9a5360fc2e4e7366a586f1c54ecc736ff0e96"
  SKIP
  "04b6032d78f8dfa062b98017b8930885f6a6fa6ee3de12bff99f68aea86bbfb3"
  "c8f94bf092faf3e954d85124996538e1891a054f2879cf9c9f837a3b29499930"
)
validpgpkeys=('2BEFDA8D830FA1E0C458915824EBD0202640D9B0') # Johan Thoren (GitHub Signing Key) <johan@thoren.xyz>

package() {
  install -Dm755 "${pkgname%-bin}-$pkgver-linux-x86_64" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${pkgname%-bin}-$pkgver.README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
