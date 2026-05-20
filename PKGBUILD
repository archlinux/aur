# Maintainer: Triss Healy (trissylegs) <th@trissyle.gs>
# Contributer: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin
# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
# Forked from chromedriver package
_pkgname=msedgedriver
_channel=stable
pkgname=${_pkgname}-stable-bin
pkgver=148.0.3967.70
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
# eg https://msedgedriver.microsoft.com/148.0.3967.70/edgedriver_linux64.zip
source=("${_pkgname}_${pkgver}_linux64.zip::https://msedgedriver.microsoft.com/${pkgver}/edgedriver_linux64.zip")
sha512sums=('114e75b9cc4ba59301c7d91b536e6c1b90a271e1863f2f8c214044754737b80ad86b2df4a54d5db7e87146fb200d8cd9fb716275e5eb390df67abe985dd67531')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
}
