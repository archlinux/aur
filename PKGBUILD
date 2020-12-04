# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=menyoki-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Screen{shot,cast} and perform ImageOps on the command line"
arch=('x86_64')
url="https://github.com/orhun/menyoki"
license=('GPL3')
depends=('libx11')
optdepends=('slop: area selection support')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz"{,.sig})
sha512sums_x86_64=('6420d3ea0a44c8eb68f2106e0cc868aa6c7a6acbccc626df450bc0953c4a0ce6557041f46036e864b2b0605ce0a8286127b557ba1709ad9de9e76af118ce12dc'
                   'SKIP')
validpgpkeys=('9965F7E78C54A004D475D6FA53F218C35C1DC8B1') # menyoki <menyoki.cli@protonmail.com>

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "man/${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "man/${pkgname%-bin}.conf.5" -t "$pkgdir/usr/share/man/man5"
  install -Dm 644 "completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
  install -Dm 644 "completions/${pkgname%-bin}.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "completions/${pkgname%-bin}.zsh" "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_${pkgname%-bin}"
}
