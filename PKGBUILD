# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=systemd-cleanup-pacman-hook
pkgver=4
pkgrel=1
pkgdesc="Pacman hook to stop and disable systemd units before removing packages"
arch=('any')
url="https://github.com/YHNdnzj/systemd-cleanup-pacman-hook"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('92024f91472a0e153aa8ddad1d55bdcdf3eff10dfb316be0b903621d8e15b586')

package() {
    depends=('findutils' 'systemd')

    cd "$pkgname-$pkgver"

    install -Dm644 systemd-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/systemd-cleanup.hook"
    install -Dm755 systemd-cleanup "$pkgdir/usr/share/libalpm/scripts/systemd-cleanup"

    install -Dm644 README.md "$pkgdir/usr/share/doc/systemd-cleanup-pacman-hook/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/systemd-cleanup-pacman-hook/LICENSE"
}

# vim: set ts=4 sw=4 et:
