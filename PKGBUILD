# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termchat-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Terminal chat through the LAN"
arch=('x86_64')
url="https://github.com/lemunozm/termchat"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha512sums_x86_64=('a9e0b29c7536805d4307ddbc708101ba493d4189d9d1a636b38642a5be3337dd65e62c9431d25074e60bc1d1dc0e58c54c06b6e611c4e14c91680de55bcd425f')

package() {
  cd "${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
