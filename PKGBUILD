# Maintainer: Christian Schendel <doppelhelix@gmail.com>
# shellcheck disable=2034,2154,2164
pkgname=signal-monochrome-tray
pkgdesc="changes the tray icon of Signal to monochrome"
pkgver=0.2.01
pkgrel=1
url="https://gitlab.com/doppelhelix/signal-monochrome-tray-hook"
arch=(any)
license=(
    GPL-3.0-or-later
)
depends=(
    asar
    imagemagick
    papirus-icon-theme
    signal-desktop
)
_archive="$pkgname-hook-v$pkgver"
source=("$_archive.tar.gz::$url/-/archive/v$pkgver/$pkgname-hook-v$pkgver.tar.gz")
sha256sums=('23c39f8db371ec6dacc1a868cdc94a0758c8af4e71f519f109885b74dba54c87')

package() {
    cd "$_archive"
    install -Dm0755 -t "$pkgdir/usr/share/libalpm/scripts/" signal-tray
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" signal-tray.hook
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: set ts=4 sw=4 et:
