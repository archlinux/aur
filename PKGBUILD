# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=goat-bin
pkgver=0.10.0
pkgrel=2
pkgdesc="Better sleep"
arch=('x86_64')
url="https://github.com/brocode/goat"
license=('custom:WTFPL')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-README.org::$url/raw/v$pkgver/README.org")
sha512sums_x86_64=('aec038209b502dceb56ae249fe4c80d12e63b803c666c5806396285e62c3539fb7082a67170fb29df68d3b1964a817cfdfe7907a32a1261153d9aeaf95baca03'
                   '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421'
                   '4c12bb43e49c3e843cf76af3425dd3fa6cec11049c2b39fc14719bf6a06a1ac3bdeb4c9d15c4fe19376844affa70ecc24df55a98a7b8ce0367f01f56c8a5fafa')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.org" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
