# Maintainer: James Cherti | Contact: http://www.jamescherti.com/contact

pkgname=linux-keep-modules
pkgver=1.0.1
pkgrel=1
pkgdesc="Preserve the Linux kernel modules during and after an upgrade"
url="https://github.com/jamescherti/archlinux-linux-keep-modules"
arch=('any')
license=('MIT')
depends=(bash rsync coreutils)
install="$pkgname.install"
source=(LICENSE
        cleanup-linux-modules.service
        linux-modules-backup.hook
        linux-modules-restore.hook
        pacman-hook-linux-modules.sh)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    cd "$srcdir"

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        "LICENSE"

    install -Dm644 -t "$pkgdir/usr/lib/systemd/system" \
        "cleanup-linux-modules.service"

    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" \
        "linux-modules-backup.hook" \
        "linux-modules-restore.hook"

    install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" \
        "pacman-hook-linux-modules.sh"
}
