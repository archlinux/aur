# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: kdheepak <me@kdheepak.com>
# https://github.com/orhun/pkgbuilds

pkgname=taskwarrior-tui-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="A Terminal User Interface for Taskwarrior"
arch=('x86_64')
url="https://github.com/kdheepak/taskwarrior-tui"
license=('MIT')
depends=('task')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
        "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha256sums_x86_64=('6f9d3a2b5539a63cf9e6afeba34ef9506b9d4b87b4fee64194ba5e0185a3b0aa'
                   '0591178e63904cfbcd6c5efc0490d59637aaede5e2e14e79e978a8162981a755'
                   '8d5487f4929c9b2bbe43c600f6842a8eb6aa158f5e71baef01ab2680f0dd3cc7')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
