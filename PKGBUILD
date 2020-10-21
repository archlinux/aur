# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termimage-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Display images in your terminal"
arch=('x86_64')
url="https://github.com/nabijaczleweli/termimage"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver"
        "${pkgname%-bin}-v$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
        "$url/releases/download/v$pkgver/${pkgname%-bin}-man-v$pkgver.tbz2")
sha512sums_x86_64=('379d7a598bb669ffae6e7bf60071e9cbb80e81969faf1fb1fa7bd174b0ed465b5d291b238c53b80139e9f87eea4f3e7e905880e1db2941d62ca5ca76a9cfceb7'
                   '25e0f2eb4d34813f14fabea8245680d734a50ff3be597146c47d4d6c819f61f4f8bb1c6ffa4f9047725aa6923d5db3043b7add60b5f428ab29de6932a70b8a24'
                   '7e2f220b7b023f357c1ee32ac7ed2936e4b01378d8fd2bf96becedb4dd16e8bae4a7eb57790292342beb9512e915e52d782782e04aec28d6d415f6741f241c5b')

package() {
  install -Dm 755 "${pkgname%-bin}-v$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-v$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm 644 "${pkgname%-bin}-man-v$pkgver/${pkgname%-bin}.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-man-v$pkgver/${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
}
