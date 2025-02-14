# Maintainer: wackbyte <wackbyte@protonmail.com>

_pkgname=asphalt
pkgname=asphalt-bin
pkgver=0.9.1
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
b2sums=('057e685339a9fe2c9991d874701cb999274d3f51685a62f298babd3480d022b7a1b8bb248cfce9aa5c8bc3fdb7be3581b4a7286b3909cf109e0a8c3d59d60326')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
