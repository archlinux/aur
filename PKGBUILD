# Maintainer: liolok <aur@liolok.com>

# https://extensions.gnome.org/extension-info/?pk=352&shell_version=3.38
_gnome_site='https://extensions.gnome.org'
_name='middleclickclose'
_uuid='middleclickclose@paolo.tranquilli.gmail.com'
_pk=352
_gnome_shell_version=3.38
_version=17
_version_tag=19150

pkgname="gnome-shell-extension-$_name"
pkgver=$_version
pkgrel=2
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="$_gnome_site/extension/$_pk/$_name/"
license=('GPL2')
depends=("gnome-shell>=$_gnome_shell_version")
source=("$pkgname.zip::$_gnome_site/download-extension/$_uuid.shell-extension.zip?version_tag=$_version_tag")
sha256sums=('a0f1877c1f14e69d42e3cb0e701c51b354736e9760462bc314de99acd8091f73')

package() {
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    install --directory "$_destdir"
    chmod 644 ./metadata.json
    cp --archive ./*[^*.zip] --target-directory="$_destdir"
}
