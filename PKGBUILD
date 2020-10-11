# Maintainer: liolok <aur@liolok.com>

# https://extensions.gnome.org/extension-info/?pk=701&shell_version=3.36
_gnome_site='https://extensions.gnome.org'
_name='scroll-workspaces'
_uuid='scroll-workspaces@gfxmonk.net'
_pk=701
_gnome_shell_version=3.36
_version=22
_version_tag=16519

pkgname="gnome-shell-extension-$_name"
pkgver=$_version
pkgrel=1
pkgdesc='Change workspaces by scrolling while over the top panel in Gnome Shell'
arch=('any')
url="$_gnome_site/extension/$_pk/$_name/"
license=('GPL')
depends=("gnome-shell>=$_gnome_shell_version")
source=("$pkgname.zip::$_gnome_site/download-extension/$_uuid.shell-extension.zip?version_tag=$_version_tag")
sha256sums=('0acbcc0a0ea10d221e15a45ea861994ad290fee0df237531fe16ac15b4842268')

package() {
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    install --directory "$_destdir"
    chmod 644 ./metadata.json
    cp --archive ./*[^*.zip] --target-directory="$_destdir"
}
