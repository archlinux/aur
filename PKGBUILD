# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=plasma6-applets-ha-pages
_pkgname=plasma-ha-pages
_appid=io.github.winiciuscota.hapages
pkgver=1.0.0
pkgrel=1
pkgdesc="KDE Plasma 6 widget showing Home Assistant dashboard sections as pages, read live from Lovelace"
arch=('any')
url="https://github.com/winiciuscota/plasma-ha-pages"
license=('GPL-3.0-or-later')
depends=('plasma-workspace' 'qt6-websockets' 'kwallet')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4dd4551154351bfa6b6d8e056231061a73f7d2a3c4ba2364b50953aeb4754854')

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
