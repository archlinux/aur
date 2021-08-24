# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=systemd-cleanup-pacman-hook
pkgver=5.0.1
pkgrel=1
pkgdesc="Pacman hook to stop and disable systemd units before removing packages"
arch=('any')
url="https://github.com/YHNdnzj/systemd-cleanup-pacman-hook"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5773f46ae62618d3bd86f9540fce596beeccc1c2dfd8003bdabccefdf815a96e')

package() {
    depends=('bash' 'systemd')

    cd "$pkgname-$pkgver"

    install -Dm644 systemd-cleanup.hook "$pkgdir/usr/share/libalpm/hooks/systemd-cleanup.hook"
    install -Dm755 systemd-cleanup "$pkgdir/usr/share/libalpm/scripts/systemd-cleanup"

    install -Dm644 README.md "$pkgdir/usr/share/doc/systemd-cleanup-pacman-hook/README.md"
}

# vim: set ts=4 sw=4 et:
