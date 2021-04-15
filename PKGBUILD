# Maintainer: liolok <aur@liolok.com>

# https://extensions.gnome.org/extension-info/?pk=701&shell_version=40
_gnome_site='https://extensions.gnome.org'
_name='scroll-workspaces'
_uuid='scroll-workspaces@gfxmonk.net'
_pk=701
_gnome_shell_version=40
_version=23
_version_tag=23704

pkgname="gnome-shell-extension-$_name"
pkgver=$_version
pkgrel=1
pkgdesc='Change workspaces by scrolling while over the top panel in Gnome Shell'
arch=('any')
url="$_gnome_site/extension/$_pk/$_name/"
license=('GPL')
depends=("gnome-shell>=$_gnome_shell_version")
source=("$pkgname.zip::$_gnome_site/download-extension/$_uuid.shell-extension.zip?version_tag=$_version_tag")
sha256sums=('d440ea7962d647764f394cddb6b1c108a5cbbbb0a3df9ab728d4e69a502bb570')

package() {
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    install --directory "$_destdir"
    chmod 644 ./metadata.json
    cp --archive ./*[^*.zip] --target-directory="$_destdir"
}
