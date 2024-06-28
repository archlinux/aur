# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=systemd-cleanup-pacman-hook
pkgver=9
pkgrel=1
pkgdesc="Pacman hook to stop and disable systemd units before removing packages"
arch=('any')
url="https://github.com/YHNdnzj/systemd-cleanup-pacman-hook"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('d659dddc2791a609c3750a69ed9596420b2d947d0b5f3da951bdfb7ebeca245328948fbb9d6d118c7ca821e5f264efd4370c52b82949fe95779fe2509682784e')

package() {
    depends=('bash' 'systemd>=256')

    cd "$pkgname-$pkgver"

    install -Dm644 systemd-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/systemd-cleanup.hook"
    install -Dm755 systemd-cleanup "$pkgdir/usr/share/libalpm/scripts/systemd-cleanup"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
