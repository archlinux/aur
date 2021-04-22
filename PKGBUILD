# Maintainer: Matthieu Borde <starmatt at free dot fr>

pkgname=gnome-shell-extension-babar
pkgver=51
pkgrel=1
pkgdesc='GNOME shell extension that adds grid, favorites, workspaces & tasks in top panel'
arch=(any)
url='https://github.com/fthx/babar'
license=('GPL3')
depends=('gnome-shell>=3.36')
source=("https://extensions.gnome.org/extension-data/babarfthx.v${pkgver}.shell-extension.zip")
md5sums=('4f2ee8d5bb94aff8418e9d1c8653f64e')

package() {
    local _uuid="babar@fthx"
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install --directory "$_destdir/schemas"
    install --target-directory "$_destdir" --mode 644 metadata.json *.js *.css
    install --target-directory "$_destdir/schemas" --mode 644 schemas/*
}
