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
pkgver=94.0.992.14
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
sha512sums=('d1039fba5cc4ec211ea43d515eca8ae26b95914a8f906270acc584d3b37345345f22c798259dcae4b2dfb1ce99d85407f8927bba0d3ac49593aa1dd920fb79df')

package() {    
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/Driver_Notes/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${srcdir}/Driver_Notes/credits.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
