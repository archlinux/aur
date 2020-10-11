# Maintainer: liolok <aur@liolok.com>

# https://extensions.gnome.org/extension-info/?pk=1379&shell_version=3.36
_gnome_site='https://extensions.gnome.org'
_name='services-systemd'
_uuid='services-systemd@abteil.org'
_pk=1034
_gnome_shell_version=3.34
_version=21
_version_tag=13249

pkgname="gnome-shell-extension-$_name"
pkgver=$_version
pkgrel=1
pkgdesc="Gnome Shell Extension that allows to start and stop systemd services"
arch=('any')
url="$_gnome_site/extension/$_pk/$_name/"
license=('GPL')
depends=("gnome-shell>=$_gnome_shell_version")
conflicts=("gnome-shell-extension-$_name-git")
source=("$pkgname.zip::$_gnome_site/download-extension/$_uuid.shell-extension.zip?version_tag=$_version_tag")
sha256sums=('0c93bfca39bc52a4966867ee52aa38108f821468f068ff2a90cd10927b8cad1f')

package() {
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    install --directory "$_destdir"
    chmod 644 ./metadata.json
    cp --archive ./*[^*.zip] --target-directory="$_destdir"
}
