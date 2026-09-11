# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=rclone-sync-timer
pkgver=1.0.0
pkgrel=3
pkgdesc="systemd user units to periodically sync rclone remotes to local directories"
arch=('any')
url="https://aur.archlinux.org/packages/rclone-sync-timer"
license=('0BSD')
depends=('rclone')
install=rclone-sync-timer.install
source=("rclone-sync@.service"
        "rclone-sync@.timer"
        "example.conf"
        "README.md"
        "LICENSE")
# Local files from this AUR repo, nothing is downloaded.
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm644 rclone-sync@.service \
        "$pkgdir/usr/lib/systemd/user/rclone-sync@.service"
    install -Dm644 rclone-sync@.timer \
        "$pkgdir/usr/lib/systemd/user/rclone-sync@.timer"

    install -Dm644 example.conf \
        "$pkgdir/usr/share/doc/$pkgname/example.conf"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
