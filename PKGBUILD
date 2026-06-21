# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=signal-monochrome-tray
pkgver=0.3.7
pkgrel=1
pkgdesc="changes the tray icon of Signal to monochrome (dark theme only)"
url="https://codeberg.org/doppelhelix/signal-monochrome-tray-hook"
arch=(any)
license=(
    0BSD
)
makedepends=(
    git
)
source=("$pkgname-$pkgver::git+$url.git#tag=${pkgver}?signed")
b2sums=('1e10a5c5180e349e02c0e069d4dba59970f12c844a8cf89922d8ffe9ee111253ab8040e82b15a9b5544fbeeeff58799f73cf70b0288eb3c354164aeec5a9189f')
validpgpkeys=(
    '47D15FC0F6AD8433CD06B4DF5874D2437CD5BBB3' # Christian Schendel <doppelhelix@gmail.com>
)
package() {
    depends+=(
        asar
        bash
        librsvg
        papirus-icon-theme
        signal-desktop
    )
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/share/libalpm/scripts/" signal-tray
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" signal-tray.hook
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: set ts=4 sw=4 et:
