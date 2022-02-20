# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=gnome-shell-extension-color-picker
pkgver=27
pkgrel=1
pkgdesc='Simple color picker for gnome shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('gnome-shell>=41')
source=("https://extensions.gnome.org/extension-data/color-pickertuberry.v${pkgver}.shell-extension.zip")
sha256sums=('6e324ae413867538c9a7b407130026d38b6db048f3923e935089330f2152d57c')

package() {
    local _uuid="color-picker@tuberry"
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install --directory "$_destdir/icons"
    install --directory "$_destdir/schemas"
    install --target-directory "$_destdir" --mode 644 metadata.json *.js *.css
    install --target-directory "$_destdir/icons" --mode 644 icons/*
    install --target-directory "$_destdir/schemas" --mode 644 schemas/*
}
