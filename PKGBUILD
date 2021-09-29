# Maintainer: Triss Healy (trissylegs) <th@trissyle.gs>
# Contributer: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin
# Forked from chromedriver package
_pkgname=msedgedriver
_channel=beta
pkgname=${_pkgname}-${_channel}-bin
pkgver=95.0.1020.9
pkgrel=1
pkgdesc="Standalone server that implements the W3C WebDriver standard (for microsoft edge)"
arch=('x86_64')
url="https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/"
license=('BSD' 'custom')
depends=(glib2 nss xdg-utils)
optdepends=(microsoft-edge-beta=${pkgver}-${pkgrel})
provides=("${_pkgname}=${pkgver}" "${_pkgname}-${_channel}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-beta"
    "${_pkgname}-dev"
    "${_pkgname}-bin"
    # "${_pkgname}-beta-bin"
    "${_pkgname}-dev-bin"
)
# https://msedgedriver.azureedge.net/94.0.992.14/edgedriver_linux64.zip
source=("${_pkgname}_${pkgver}_linux64.zip::https://msedgedriver.azureedge.net/${pkgver}/edgedriver_linux64.zip")
sha512sums=('25bb8a22c0ce893d8683be81edcce112e5104a76a040e5f59f83a9b7d8485f8d2ee4838680c2ff19a6f064ac706f8d34954f931b070b7c4b3ea361f3e2ac6936')

package() {    
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/Driver_Notes/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${srcdir}/Driver_Notes/credits.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
