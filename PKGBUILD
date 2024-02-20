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
pkgver=121.0.2277.128
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
sha512sums=('af21eb39d26d00bc6da21a9e2975f18db0d0b351e4f688f5605eb921e0f97631686730e5f087967be55c185b8e32417236709f6dbfc24766e977c048f669df77')

package() {    
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
}
