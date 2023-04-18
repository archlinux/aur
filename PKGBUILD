# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=halp-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="A CLI tool to get help with CLI tools"
arch=('x86_64')
url="https://github.com/orhun/halp"
license=('MIT' 'Apache')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('f21912afaef3925864b533f383ddaf8f3f71bd7609d7818fb7aa811a6ef2b99372554bfb4002e90e3bf78bd0e63ed377dcdb0d6cadcae0648f9edcdc48a4eb05')

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
