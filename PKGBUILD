# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=bookmark-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Save URLs from the terminal and open them quickly in the browser"
arch=('x86_64')
url="https://github.com/Szymongib/bookmark"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('332ccdd85a23e4a8fcbd324d9251a44b42e940dd42668da64415d611765305b57dd19f4357ae714e45065b33d5a7377ebbf973949eb61ca03ec52e70df84c5ba'
                   '3f2e09ba09ef8567e5f70e20776075f952bcb4fc632c3bbe771287cd442f202b0f6f140df2870775d27d1ce5a513e29f92d9f978d8563ae16b671526a9d3c48f'
                   'ef77c1169d7fdb13f7afa407bba76110ac1230e845e3c0d73528ccb959bcccb493d2ebb7e24753c5852afd5ad196f59ca426d20346cc67f34eb57debec5160e4')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
