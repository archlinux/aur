# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=shy-bin
pkgver=0.1.9
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
sha512sums_x86_64=('ea166c61625df723356d45127d933d59dc7dcb4710e9b890101c4a0d8cb6a3af1df80fd5e58c3416f5f1ab665243f30b24f31a98bd8f48534497846e2ee44f89'
                   '35dfcd7980f4de2dfafd4ce335ad70f6a058dbcbdc57f91c85684676c19750daec61ecbec567d03cdd1ca5ee37477b49a23ebdea6c1ba48fc7c4d32800a00033'
                   '602c05360ab710ce5f5d92e7ed37cde11771528dc196e39d11b89bc2c09599b6a957a7ee87a36cb8fe859456e7748dcecf7e8d7e75d3269b93dfc919b84fa82b')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "${pkgname%-bin}-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm 644 "${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
}
