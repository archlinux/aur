# Maintainer: Triss Healy (trissylegs) <th@trissyle.gs>
# Contributer: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin
# Forked from chromedriver package
_pkgname=msedgedriver
_channel=stable
pkgname=${_pkgname}-stable-bin
pkgver=96.0.1054.62
pkgrel=1
pkgdesc="Standalone server that implements the W3C WebDriver standard (for microsoft edge)"
arch=('x86_64')
url="https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/"
license=('BSD' 'custom')
depends=(glib2 nss xdg-utils)
optdepends=(microsoft-edge-${_channel}=${pkgver}-${pkgrel})
provides=("${_pkgname}=${pkgver}" "${_pkgname}-${_channel}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-beta"
    "${_pkgname}-dev"
    "${_pkgname}-bin"
    "${_pkgname}-beta-bin"
    "${_pkgname}-dev-bin"
)
# eg https://msedgedriver.azureedge.net/94.0.992.14/edgedriver_linux64.zip
source=("${_pkgname}_${pkgver}_linux64.zip::https://msedgedriver.azureedge.net/${pkgver}/edgedriver_linux64.zip")
sha512sums=('24acf5a3d8498b8095ef01c613030bbd20b36668f5fa61226413c0afc088350cc64e078a0dd4cdae7e03d7f39560386d3886639e4a3228e9058c411248587b57')

package() {    
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/Driver_Notes/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${srcdir}/Driver_Notes/credits.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
