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
pkgver=119.0.2151.58
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
sha512sums=('2e62ab9625c4a0477548df6046ae7d7264ee5333577a65770f19d75aead30dc7a6d51a88fb099b58fa7c2520575dc86b4d297f5c5538aab8ae0c51b6db9cd727')

package() {    
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
}
