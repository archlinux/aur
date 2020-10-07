# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=shy-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Bare-bones SSH launcher"
arch=('x86_64')
url="https://github.com/xvxx/shy"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-v${pkgver}-linux-x86_64.tgz"
               "${pkgname%-bin}-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('caed7f4f97aa1a1c34ce5b378ead2254fd26156f01b7caba011e64a6fb83940d047ff709d9faa9cbd68d39d7a609d67e063ed34ccab58bb87002c814803a4236'
                   '35dfcd7980f4de2dfafd4ce335ad70f6a058dbcbdc57f91c85684676c19750daec61ecbec567d03cdd1ca5ee37477b49a23ebdea6c1ba48fc7c4d32800a00033'
                   '6abc09417b5c4a8cbf8fea3b62ee6fe452beefee023281afed01cd6c9f588b956e400941f2e520ab98083f4508e0775cf623cdf3d4f01eac95ec1c5c62db9441')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm 644 "${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
}
