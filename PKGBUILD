# Maintainer: Jakub Czarnota <jakub.czarnota@protonmail.com>
pkgname=paf-notify
pkgver=1.0.0
pkgrel=1
pkgdesc="Notifies about pacman, AUR, and flatpak updates"
arch=('any')
license=('MIT')
depends=('bash' 'python' 'python-gobject' 'libnotify' 'pacman-contrib')
optdepends=(
    'yay: AUR helper (used by default)'
    'paru: Alternative AUR helper'
    'flatpak: For flatpak update checks'
)
source=("git+https://github.com/JakubCzarnota/paf-notify.git#tag=v${pkgver}")
md5sums=('3696ee9182e7d9c675b614068c588c1b')

package() {
    # Python source files
    install -Dm755 "$srcdir/paf-notify/paf_notify.py" "$pkgdir/usr/lib/paf-notify/paf_notify.py"
    install -Dm644 "$srcdir/paf-notify/config.py" "$pkgdir/usr/lib/paf-notify/config.py"
    install -Dm755 "$srcdir/paf-notify/updates.py" "$pkgdir/usr/lib/paf-notify/updates.py"

    # Launcher script
    install -Dm755 "$srcdir/paf-notify/run-paf-notify.sh" "$pkgdir/usr/bin/paf-notify"
}

