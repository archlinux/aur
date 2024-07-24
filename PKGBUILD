# Maintainer: Christian Schendel <doppelhelix@gmail.com>
# shellcheck disable=2034,2154,2164
pkgname=signal-monochrome-tray
pkgdesc="changes the tray icon of Signal to monochrome"
pkgver=0.2.0
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
source=("$pkgname-hook-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-hook-v$pkgver.tar.gz")
sha256sums=('8fe9acf45094041961c308cef82d6c2b204a7ff55566db81812d1baf09d86452')

package() {
    cd "$srcdir/$pkgname-hook-v$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks/" signal-tray.hook
    install -Dt "$pkgdir/usr/share/libalpm/scripts/" signal-tray
}

# vim: set ts=4 sw=4 et:
