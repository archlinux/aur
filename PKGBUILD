# Maintainer: Radon Rosborough <radon@radian.codes>

_pkgname=panel-date-format
pkgname=gnome-shell-extension-panel-date-format
pkgver=23
pkgrel=1
pkgdesc='Allows to customize the date format on the panel'
arch=('any')
url="https://github.com/KEIII/gnome-shell-${_pkgname}"
license=('MIT')
depends=('gnome-shell')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bab6f1f3458bffa51080da5d7b13e0494e58e16fc6a8fe9d803d729d1190a779')

package() {
    cd "gnome-shell-${_pkgname}-${pkgver}"

    local _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

    install -Dm644 -t "${_destdir}" metadata.json extension.js icon.svg
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
