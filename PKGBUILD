# Maintainer: Radon Rosborough <radon@radian.codes>

_pkgname=panel-date-format
pkgname=gnome-shell-extension-panel-date-format
pkgver=25
pkgrel=1
pkgdesc='Allows to customize the date format on the panel'
arch=('any')
url="https://github.com/KEIII/gnome-shell-${_pkgname}"
license=('MIT')
depends=('gnome-shell>=1:45' 'gnome-shell<1:52')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c78ad44f1aef58c6d57edff16b6f4f2e2cf672e3b2dedd35400ac4d1cd4989b8')

package() {
    cd "gnome-shell-${_pkgname}-${pkgver}"

    local _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

    install -Dm644 -t "${_destdir}" metadata.json extension.js icon.svg
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
