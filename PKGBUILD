# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=gnome-shell-extension-color-picker
pkgver=27
pkgrel=2
pkgdesc='Simple color picker for gnome shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('gnome-shell>=41')
source=("https://extensions.gnome.org/extension-data/color-pickertuberry.v${pkgver}.shell-extension.zip")
sha256sums=('c8b7e269f214ce97b81930cdd9ca34b28d8d7f8736b69d5ea76d6f3f9dd73de9')

package() {
    local _uuid="color-picker@tuberry"
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install --directory "$_destdir/icons"
    install --directory "$_destdir/schemas"
    install --directory "$_destdir/locale"
    install --target-directory "$_destdir" --mode 644 metadata.json *.js *.css
    install --target-directory "$_destdir/icons" --mode 644 icons/*
    install --target-directory "$_destdir/schemas" --mode 644 schemas/*
    cp -dr --preserve=mode,timestamp locale/* "$_destdir/locale"
}
