# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fblog-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="Small command-line JSON log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('custom:WTFPL')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-README.org::$url/raw/v$pkgver/README.org")
sha512sums_x86_64=('58a65b8894121d8a0689309c14666590d6a3c0392691898dcd8de17109be4eec268b288d8dbab1c22e90998fc0ea7d39ddc095404ecd102f4489c911763e649e'
                   '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421'
                   '2c38965b48d6269a17a0b16db47e68aa28f285966994421dae3c7711a63125db3bff3c02036bdd91cdaa8c560a380fd1b06025d1d911b83fcdf497d1bc648af9')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.org" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
