# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lipl-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Analyse the output over time of custom shell commands"
arch=('x86_64')
url="https://github.com/yxdunc/lipl"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-linux.tar.gz"
        "${pkgname%-bin}-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
        "${pkgname%-bin}-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums=('bf9d64e49f0bf77d1f6daf7fe68538e45a19e528dd18caf11898dd66b94f5a070e65e5bfd474349e04d8d4a4684507a61b2340eb890ae78afcc5be09fdaf88d6'
            '845ea50d8249e25f4b7267716ed84cb87240aed6e81f56cd63607b84b9eca360ce3230be761621451644a5e3118d5624fb887f09c01428f34fca093c6adbec6f'
            'b88dda9425d154ea25701eadcc4f07abf0d98b7a1ab2204d32ce3e6e6beac4bed6a0210fe6f5a2d38e5de8060a8000f96a445242a556ade4ab29191a62db82cd')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 ${pkgname%-bin}-$pkgver-LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
