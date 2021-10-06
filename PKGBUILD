# Maintainer: liolok <aur@liolok.com>

# https://extensions.gnome.org/extension-info/?pk=1379&shell_version=3.38
_gnome_site='https://extensions.gnome.org'
_name='mpris-indicator-button'
_uuid='mprisindicatorbutton@JasonLG1979.github.io'
_pk=1379
_gnome_shell_version=3.38
_version=19
_version_tag=26789

pkgname="gnome-shell-extension-$_name"
pkgver=$_version
pkgrel=1
pkgdesc="A full featured MPRIS indicator button extension for GNOME Shell 3.38+"
arch=('any')
url="$_gnome_site/extension/$_pk/$_name/"
license=('GPL3')
depends=("gnome-shell>=$_gnome_shell_version")
source=("$pkgname.zip::$_gnome_site/download-extension/$_uuid.shell-extension.zip?version_tag=$_version_tag")
sha256sums=('d7aa938244e94201d5e81a9afd9a565e9226adc4ce17fb1b6928d81daef5ed9b')

package() {
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    install --directory "$_destdir"
    chmod 644 ./metadata.json
    cp --archive ./*[^*.zip] --target-directory="$_destdir"
}
