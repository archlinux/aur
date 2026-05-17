# Maintainer: Kernel236 <riccardo.delsignore01@gmail.com>
pkgname=lazypac
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple lazy human-readable wrapper for pacman/yay/paru"
arch=('any')
url="https://github.com/Kernel236/lazypacman"
license=('MIT')
depends=('bash' 'pacman-contrib')
optdepends=('yay: AUR helper (recommended)'
            'paru: AUR helper')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('988643d2eb05c495256f6b7addc777ff13b3a559dbb0feddb7be27b99fedf964')

package() {
    cd "$srcdir/lazypacman-$pkgver"
    install -Dm755 lazypac "$pkgdir/usr/bin/lazypac"
    install -Dm644 lib/help.sh     "$pkgdir/usr/lib/lazypac/help.sh"
    install -Dm644 lib/config.sh   "$pkgdir/usr/lib/lazypac/config.sh"
    install -Dm644 lib/packages.sh "$pkgdir/usr/lib/lazypac/packages.sh"
    install -Dm644 lib/cache.sh    "$pkgdir/usr/lib/lazypac/cache.sh"
    install -Dm644 lib/query.sh    "$pkgdir/usr/lib/lazypac/query.sh"
    install -Dm644 lib/logs.sh     "$pkgdir/usr/lib/lazypac/logs.sh"
    install -Dm644 lazypac.1 "$pkgdir/usr/share/man/man1/lazypac.1"
    gzip -9 "$pkgdir/usr/share/man/man1/lazypac.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
