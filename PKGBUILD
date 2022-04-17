# Maintainer: Rahul Menon <rmeno12 at utexas dot edu>

pkgname=yay-cache-cleanup-hook
pkgver=1.1.3
pkgrel=1
pkgdesc='Pacman hook to clean up both pacman and yay caches'
arch=(any)
url="https://github.com/rmeno12/yay-cache-cleanup-hook"
license=('MIT')
depends=(pacman-contrib jq yay)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3ab72de900bc6119c6b058c7ce871aae44479541790f73e095d98783760112c3')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 yay-cache-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/yay-cache-cleanup.hook"
    install -Dm744 yaycache "$pkgdir/usr/local/bin/yaycache"
}
