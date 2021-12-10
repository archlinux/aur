# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=atuin-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Magical shell history"
arch=('x86_64')
url="https://github.com/ellie/atuin"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('adea73a92a812c2fd487e9e9697699fbcdce3a90c92585c71e0c0049ce5df55b7f5d138ead8608bde7b44acd39acbdc7ce52a178491f1b79f740debb1eef62d6')

package() {
  cd "${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
