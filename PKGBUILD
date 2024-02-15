# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=atuin-bin
pkgver=18.0.1
pkgrel=1
pkgdesc="Magical shell history"
arch=('x86_64')
url="https://github.com/ellie/atuin"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('62bb84c1f525a4a0ce54741415baf3ee6b004f68d73750b5630a64d89c0cd5884591a8bb9ee80b678ae659e501212d8d1fc37572ca430f1b0a4beec6945d93f7')

package() {
  cd "${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
  install -Dm 644 "completions/${pkgname%-bin}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
}
