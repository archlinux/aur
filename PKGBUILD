# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=rusolver-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast and accurate DNS resolver"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/rusolver"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/$pkgver/README.md"
               "${pkgname%-bin}-$pkgver-man.1::$url/raw/$pkgver/${pkgname%-bin}.1")
sha256sums_x86_64=('176e3d6486cf60797f7132aef78c0d22dc349ea1ae91b60efca81033af6e4317'
                   '067b297fe6b24e3596a7fd9d697e7292fdb51f814f0c2ee62991c62d6fc43dcf'
                   'f5f473d0abc8f5387b1a21a0ede827fbc5d961d6641b765b2d6ccbfa44360a32')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
