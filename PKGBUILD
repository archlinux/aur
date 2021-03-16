# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
depends=('zlib' 'gcc-libs' 'openssl')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/${pkgname%-bin}-linux-gnu-amd64"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('5c4a11c4c24900a8bc0827875f28fc783bda994fdaad3d187507e6e05a1fe76d5606d748f7b2af0ee3a18d288810966e27b0b56b2663918b43adbefb475cf839'
                   '8b2367a8f538e70916b579b992067526c2a968d14fa0d1744f366773a3e765a2ba5e29986fd1e59cf156d7ff18f808dfa6b88efb44eb661d4387d6a1941a4fa5')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
