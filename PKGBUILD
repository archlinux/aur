# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fclones-bin
pkgver=0.29.3
pkgrel=1
pkgdesc="Efficient Duplicate File Finder"
arch=('x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver}-linux-glibc-x86_64.tar.gz")
sha512sums_x86_64=('15d2091e766fa500c1b934bb0e07b86794fcf3b5a688cfecb509d21bd50d6ae82f46f88d5fe3c26ac0b3b7f54ada4dd80ad8243f97e6920a75b071de25d91923')

package() {
  install -Dm 755 "usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/README" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/copyright" -t "$pkgdir/usr/share/licenses/$pkgname"
}
