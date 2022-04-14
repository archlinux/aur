# Maintainer: Rahul Menon <rmeno12 at utexas dot edu>

pkgname=yay-cache-cleanup-hook
pkgver=1.1.2
pkgrel=1
pkgdesc='Pacman hook to clean up both pacman and yay caches'
arch=(any)
url="https://github.com/rmeno12/yay-cache-cleanup-hook"
license=('MIT')
depends=(pacman-contrib jq yay)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6849aeba8cc45361fd2110957c04b39a1ecb8530a9fd378ad1a18baa75008716')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 yay-cache-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/yay-cache-cleanup.hook"
    install -Dm744 yaycache "$pkgdir/usr/local/bin/yaycache"
}
