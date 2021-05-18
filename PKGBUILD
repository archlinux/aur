# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Edu4rdSHL <edu4rdshl@securityhacklabs.net>
# https://github.com/orhun/pkgbuilds

pkgname=rusolver-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Fast and accurate DNS resolver"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/rusolver"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md"
               "$pkgname-$pkgver-man.1::$url/raw/$pkgver/${pkgname%-bin}.1")
sha256sums_x86_64=('83fdf1fa21fa81707e6f17b2c9eff3b22ab5edbda9699449cec1c543455dad53'
                   '9da7191675073eb69dfd6e8f0c78c590afeed2c7ccfc468171d9746391410a80'
                   '61ae5cd67b2d403eb5a3fd9bf9bf5c07c6bd63f48f3973df3dbff75eda64d790')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-man.1" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1"
}
