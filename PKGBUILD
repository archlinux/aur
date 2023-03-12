# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=halp-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool to get help with CLI tools"
arch=('x86_64')
url="https://github.com/orhun/halp"
license=('MIT' 'Apache')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('038f7bbba3d8d7eddc6728089ba17d3a4271557321331a7dc2d9e7521c07aa3fae94931ec569cb5e19ef2394c1d76e054e426efc4bdd3a0f53b858f065c3d071')

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "completions/${pkgname%-bin}.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}"
  install -Dm 644 "completions/${pkgname%-bin}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_${pkgname%-bin}" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm 644 "man/${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
}
