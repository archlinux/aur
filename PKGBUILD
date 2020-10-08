# Maintainer: liolok <aur@liolok.com>

# https://extensions.gnome.org/extension-info/?pk=352&shell_version=3.38
_gnome_site='https://extensions.gnome.org'
_gnome_shell_version=3.38
_name='middleclickclose'
_uuid='middleclickclose@paolo.tranquilli.gmail.com'
_pk=352
_version_tag=19150

pkgname="gnome-shell-extension-$_name"
pkgver=17
pkgrel=1
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="$_gnome_site/extension/$_pk/$_name/"
license=('GPL2')
depends=("gnome-shell>=$_gnome_shell_version")
source=("$pkgname.zip::$_gnome_site/download-extension/$_uuid.shell-extension.zip?version_tag=$_version_tag")
sha256sums=('053feaf85e2b3880ba1765edbf988c8e93c503ee02ff0345ec820b1ed385954a')

package() {
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    install --directory "$_destdir"
    chmod 644 metadata.json
    cp --archive ./*[^*.zip] --target-directory="$_destdir"
}
