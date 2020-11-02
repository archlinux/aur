# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=verco-bin
pkgver=5.5.1
pkgrel=1
pkgdesc="Simple Git/Hg tui client focused on keyboard shortcuts"
arch=('x86_64')
url="https://github.com/matheuslessarodrigues/verco"
license=('MIT')
optdepends=('git: support for git repositories'
            'mercurial: support for mercurial repositories')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-x86_64"
               "${pkgname%-bin}-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('f1855bff4cedd4a6d4c85261bcad691ae9da86fe24d619d98eefca7193bc47e708feff1d8f9f0d1125af3619fe0a5ab53b327aa4a5ecfc1ad07a388f94787ff5'
                   'fb9fe2f9255a9e1392f19832bdf0dedf0b5a95097048e5f31f5a36c69fa893a349e9364c276a6abe44800e434ba9181a1ea8a4c2ce2ad06426cdfeb935ee386c'
                   '57f847a6579ebcb0705aec9b0985b538a6360d09c9704a71f0e0d022a1552e7eedc34e83954bdefcee458e1f4dbd491dfe412ca5eb1ba11a18cd9c3126d75156')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
