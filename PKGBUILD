pkgname=omarchy-delta-theme-sync
pkgver=1.1.0
pkgrel=1
pkgdesc="Automatic delta theme synchronization for Omarchy"
arch=('any')
url="https://github.com/prepin/omarchy-delta-theme-sync"
license=('MIT')
depends=('bash' 'git-delta')
makedepends=('git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/prepin/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"

  # Main executable
  install -Dm755 omarchy-delta-theme-sync "$pkgdir/usr/bin/omarchy-delta-theme-sync"

  # Supporting script (theme apply)
  install -Dm755 scripts/omarchy-delta-theme-apply "$pkgdir/usr/share/$pkgname/scripts/omarchy-delta-theme-apply"

  # Hook template
  install -Dm644 hooks-append/theme-set "$pkgdir/usr/share/$pkgname/theme-set-hook"

  # Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
