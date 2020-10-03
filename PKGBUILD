# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lipl-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Analyse the output over time of custom shell commands"
arch=('x86_64')
url="https://github.com/yxdunc/lipl"
license=('unknown')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-linux.tar.gz"
        "${pkgname%-bin}-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums=('bf9d64e49f0bf77d1f6daf7fe68538e45a19e528dd18caf11898dd66b94f5a070e65e5bfd474349e04d8d4a4684507a61b2340eb890ae78afcc5be09fdaf88d6'
            '70bc26aef6a68871a7ef855ac5cc018ecd42aad6f8b84f04d1964fd87b0b3463c881064f15b20c8066e02f98ddaf94c1709558cb9d508189d8ccbad3dce8eb14')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
