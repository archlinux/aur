# Maintainer: Radon Rosborough <radon@radian.codes>

_pkgname=panel-date-format
pkgname=gnome-shell-extension-panel-date-format
pkgver=24
pkgrel=1
pkgdesc='Allows to customize the date format on the panel'
arch=('any')
url="https://github.com/KEIII/gnome-shell-${_pkgname}"
license=('MIT')
depends=('gnome-shell')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e17f2d38ed4cc5b4a35f31b6da1a0ccafdd6a8b11154d1c312d153ed76dfa969')

package() {
    cd "gnome-shell-${_pkgname}-${pkgver}"

    local _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

    install -Dm644 -t "${_destdir}" metadata.json extension.js icon.svg
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
