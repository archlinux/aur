# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=atuin-bin
pkgver=18.2.0
pkgrel=1
pkgdesc="Magical shell history"
arch=('x86_64')
url="https://github.com/ellie/atuin"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('399e03358395ebc51816cf66c14438f7b7f5ca871274b3c9a642229dcb1851933be744088677f4bb228c7927cb0cd083cdaa34cef7a9246f4719aafa0eaa1ba0')

package() {
  cd "${pkgname%-bin}-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
  install -Dm 644 "completions/${pkgname%-bin}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
}
