# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dra-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="A command line tool to download assets from GitHub releases"
arch=('x86_64')
url="https://github.com/devmatteini/dra"
license=('MIT')
depends=('zlib' 'xz')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('84737183164966bde66372389462c5e5ee51076a6dbe88332f73206f37f52ae1ddca9e099cef89bc811eb59769f8b388a597fea841d4cd37bf3e93d213bf1789')

package() {
  cd "${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
