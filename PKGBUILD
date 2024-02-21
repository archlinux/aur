# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=bytehound-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='A memory profiler for Linux'
arch=('x86_64')
url='https://github.com/koute/bytehound'
license=('Apache' 'MIT')
depends=('gcc-libs')
provides=('bytehound')
conflicts=('bytehound')
source=(
  "bytehound-$pkgver.tar.gz::$url/releases/download/$pkgver/bytehound-x86_64-unknown-linux-gnu.tgz"
  "https://raw.githubusercontent.com/koute/bytehound/$pkgver/README.md"
  "https://raw.githubusercontent.com/koute/bytehound/$pkgver/LICENSE"
  "https://raw.githubusercontent.com/koute/bytehound/$pkgver/LICENSE-APACHE"
  "https://raw.githubusercontent.com/koute/bytehound/$pkgver/LICENSE-MIT"
)
sha256sums=('72f952412477083f5678dfad652430fcf109cbb1c9dbd17b38ec701365825aea'
            '3e86722b19789f8a329db6b23b81326a67f3e0a7f60000c8d9b93e2ac19cad45'
            'ebe44fd792bbf4038d05fe20671e421e520486a97341ebc26d2e76c9be2f66ac'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '30fefc3a7d6a0041541858293bcbea2dde4caa4c0a5802f996a7f7e8c0085652')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/bytehound"
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/bytehound-gather"
  install -Dm755 -t "$pkgdir/usr/lib" "$srcdir/libbytehound.so"
  install -Dm644 -t "$pkgdir/usr/share/licenses/bytehound" LICENSE*
  install -Dm644 -t "$pkgdir/usr/share/doc/bytehound" README.md
}
