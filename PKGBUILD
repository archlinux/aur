# Maintainer: Rahul Menon <rmeno12 at utexas dot edu>

pkgname=yay-cache-cleanup-hook
pkgver=1.1.4
pkgrel=1
pkgdesc='Pacman hook to clean up both pacman and yay caches'
arch=(any)
url="https://github.com/rmeno12/yay-cache-cleanup-hook"
license=('MIT')
depends=(pacman-contrib jq yay)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('843cb14acfaf40ffee6e6358288149549a59d2013c9984e3bd3dcfeaa5e34531')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 yay-cache-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/yay-cache-cleanup.hook"
    install -Dm744 yaycache "$pkgdir/usr/local/bin/yaycache"
}
