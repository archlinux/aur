# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lipl-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Analyse the output over time of custom shell commands"
arch=('x86_64')
url="https://github.com/yxdunc/lipl"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-linux.tar.gz"
              "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
              "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('f8c47fa7a70e1813c8bb154acfad1c99334aab8e5a07822695270519f829ad6738bfccd4cc128f21be50910c6df685a5c954c116cbf3eaeaeb939bbc1b2329f0'
                   '845ea50d8249e25f4b7267716ed84cb87240aed6e81f56cd63607b84b9eca360ce3230be761621451644a5e3118d5624fb887f09c01428f34fca093c6adbec6f'
                   'b88dda9425d154ea25701eadcc4f07abf0d98b7a1ab2204d32ce3e6e6beac4bed6a0210fe6f5a2d38e5de8060a8000f96a445242a556ade4ab29191a62db82cd')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
