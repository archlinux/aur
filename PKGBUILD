# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=plasma6-applets-market-tiles
_pkgname=plasma-market-tiles
_appid=io.github.winiciuscota.markettiles
pkgver=1.0.0
pkgrel=1
pkgdesc="KDE Plasma 6 widget: crypto, stock and currency tiles with sparklines, alerts and holdings (Yahoo Finance)"
arch=('any')
url="https://github.com/winiciuscota/plasma-market-tiles"
license=('GPL-3.0-or-later')
depends=('plasma-workspace' 'python' 'curl')
optdepends=('libnotify: price alert notifications')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72ce4d56bc91c1b650144c4b7720f16ef62004b6ff61ade8e6ab957fa61999cf')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    local _dest="$pkgdir/usr/share/plasma/plasmoids/$_appid"
    install -dm755 "$_dest"
    cp -r package/. "$_dest/"
    find "$_dest" -type d -exec chmod 755 {} +
    find "$_dest" -type f -exec chmod 644 {} +
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
