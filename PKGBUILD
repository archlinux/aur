# Maintainer: Matthieu Borde <starmatt at free dot fr>

pkgname=gnome-shell-extension-babar
pkgver=55
pkgrel=2
pkgdesc='GNOME shell extension that adds grid, favorites, workspaces & tasks in top panel'
arch=(any)
url='https://github.com/fthx/babar'
license=('GPL3')
depends=('gnome-shell>=3.36')
source=("https://extensions.gnome.org/extension-data/babarfthx.v${pkgver}.shell-extension.zip")
md5sums=('d84036052d1fe69b6d7bdce457935d58')

package() {
    local _uuid="babar@fthx"
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install --directory "$_destdir/schemas"
    install --target-directory "$_destdir" --mode 644 metadata.json *.js *.css
    install --target-directory "$_destdir/schemas" --mode 644 schemas/*
}
