# Maintainer: Matthieu Borde <dev at starmatt dot net>

pkgname=gnome-shell-extension-babar
pkgver=56
pkgrel=1
pkgdesc='GNOME shell extension that adds grid, favorites, workspaces & tasks in top panel'
arch=(any)
url='https://github.com/fthx/babar'
license=('GPL3')
depends=('gnome-shell>=3.36')
source=("https://extensions.gnome.org/extension-data/babarfthx.v${pkgver}.shell-extension.zip")
sha256sums=('981098ce8d27f9399e6560462326503ef701cf008396fe90c4efa05b9c9b00c3')

package() {
    local _uuid="babar@fthx"
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install --directory "$_destdir/schemas"
    install --target-directory "$_destdir" --mode 644 metadata.json *.js *.css
    install --target-directory "$_destdir/schemas" --mode 644 schemas/*
}
