# Maintainer: wackbyte <wackbyte@protonmail.com>

_pkgname=asphalt
pkgname=asphalt-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Upload and reference Roblox assets in code'
arch=('x86_64')
url='https://github.com/jackTabsCode/asphalt'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('unzip')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/asphalt-x86_64-unknown-linux-gnu.zip")
b2sums=('d3985d471f39a658ce7b7cfaea428b01a736c10b1818d7ef69b57109d63425dd2315d88638b0e0ec48e03dae502214e2145e4a551f5d588808b81b317231cfd9')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
