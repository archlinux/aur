# Maintainer: Christian Schendel <doppelhelix@gmail.com>
# shellcheck disable=2034,2154,2164
pkgname=signal-monochrome-tray
pkgver=0.3.1
pkgrel=2
pkgdesc="changes the tray icon of Signal to monochrome"
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
    imagemagick
    papirus-icon-theme
    signal-desktop
)
source=("$pkgname-$pkgver::git+$url.git#tag=v${pkgver}?signed")
sha256sums=('ccc25ec3c0d1651e8e01e72c86564de4ea641a090adcc7634488fc667017adc5')
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
