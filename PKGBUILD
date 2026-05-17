# Maintainer: Kernel236 <riccardo-del-signore@hotmail.it>
pkgname=lazypac
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple lazy human-readable wrapper for pacman/yay/paru"
arch=('any')
url="https://github.com/Kernel236/lazypacman"
license=('MIT')
depends=('bash')
optdepends=('yay: AUR helper (recommended)'
            'paru: AUR helper'
            'pacman-contrib: provides pacdiff, suggested after safe-upgrade')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('054fc005d5ad9a3969baa1a2ac7295d9050431211ff86a6595dc195e0c7d9bf9')

package() {
    cd "$srcdir/lazypacman-$pkgver"
    install -Dm755 lazypac "$pkgdir/usr/bin/lazypac"
    install -Dm644 lazypac.1 "$pkgdir/usr/share/man/man1/lazypac.1"
    gzip -9 "$pkgdir/usr/share/man/man1/lazypac.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
