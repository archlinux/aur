# Maintainer: Christian Schendel <doppelhelix@gmail.com>
# shellcheck disable=2034,2154,2164
pkgname=signal-monochrome-tray
pkgver=0.3.5
pkgrel=1
pkgdesc="changes the tray icon of Signal to monochrome (dark theme only)"
url="https://github.com/doppelhelix/signal-monochrome-tray-hook"
arch=(any)
license=(
    GPL-3.0-or-later
)
makedepends=(
    git
)
depends=(
    asar
    librsvg
    papirus-icon-theme
    signal-desktop
)
source=("$pkgname-$pkgver::git+$url.git#tag=v${pkgver}?signed")
sha256sums=('2cc0a7240fd05169510437b197f54cf3aca9d2363dedd41168126b04a3fbdce7')
validpgpkeys=(
    '47D15FC0F6AD8433CD06B4DF5874D2437CD5BBB3' # Christian Schendel <doppelhelix@gmail.com>
)
package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/share/libalpm/scripts/" signal-tray
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" signal-tray.hook
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: set ts=4 sw=4 et:
