# Maintainer: wackbyte <wackbyte@protonmail.com>

_pkgname=asphalt
pkgname=asphalt-bin
pkgver=0.8.4
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
b2sums=('150c8e61380443e56153a624bf7c2f8ebdcf8f31e565387eefeddf6ada07514c184953e91eb9aa8638ac31d5327950100b979c57c1ab50464d05a24b58062278')

prepare() {
    unzip -q -o -j "${_pkgname}-${pkgver}.zip"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
