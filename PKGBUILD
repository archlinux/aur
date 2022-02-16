# Maintainer: Matthieu Borde <dev at starmatt dot net>

pkgname=gnome-shell-extension-babar
pkgver=58
pkgrel=1
pkgdesc='GNOME shell extension that adds grid, favorites, workspaces & tasks in top panel'
arch=(any)
url='https://github.com/fthx/babar'
license=('GPL3')
depends=('gnome-shell>=3.36')
source=("https://extensions.gnome.org/extension-data/babarfthx.v${pkgver}.shell-extension.zip")
sha256sums=('7256f4c30e242964da3016d2ffa602b9831cd4c3bf1898aacd486c9b828c0060')

package() {
    local _uuid="babar@fthx"
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install --directory "$_destdir/schemas"
    install --target-directory "$_destdir" --mode 644 metadata.json *.js *.css
    install --target-directory "$_destdir/schemas" --mode 644 schemas/*
}
