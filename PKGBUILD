# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "${pkgname%-bin}-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('2503de8958345b997fe98077d505efdaab1309923742814fa5b0ec7ee36ce1190ba5a35171e5e834f4ae5bc3ccb4198115435144da78805c0a9251b8ab37471c'
                   '57698154aeea1a7deba43d6d6f17af92b9993a008d09ab550f8e2c1e8ce6b3d7787ff19b32d455e2c4c34fcbb8f08c1804b177cd3916c2a67d8aa27f18a7570c')

package() {
  install -Dm 755 "${pkgname%-bin}-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "${pkgname%-bin}-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
