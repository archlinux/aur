# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=systemd-cleanup-pacman-hook
pkgver=5.2.1
pkgrel=1
pkgdesc="Pacman hook to stop and disable systemd units before removing packages"
arch=('any')
url="https://github.com/YHNdnzj/systemd-cleanup-pacman-hook"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3941702a197002c60b4f40e19ccb8b6c736a49ca39118c2a90bad29db9d40387')

package() {
    depends=('bash' 'systemd')

    cd "$pkgname-$pkgver"

    install -Dm644 systemd-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/systemd-cleanup.hook"
    install -Dm755 systemd-cleanup "$pkgdir/usr/share/libalpm/scripts/systemd-cleanup"

    install -Dm644 README.md "$pkgdir/usr/share/doc/systemd-cleanup-pacman-hook/README.md"
}

# vim: set ts=4 sw=4 et:
