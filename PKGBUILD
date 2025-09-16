# Maintainer: wackbyte <im@purring.fyi>

_pkgname=asphalt
pkgname=asphalt-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Upload and reference Roblox assets in code'
arch=('x86_64')
url='https://github.com/jackTabsCode/asphalt'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('libarchive')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source=("${_pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/asphalt-x86_64-unknown-linux-gnu.tar.xz")
b2sums=('f4f0388a703e551981d95575eb7c80c8f317e95ec52f800a56d30600074ec67b15497cd13601658fd6e718ec16595466681f564c239663ad0a2ebe564418e6b5')

prepare() {
    tar -xf "${_pkgname}-${pkgver}.tar.xz"
    mv asphalt-x86_64-unknown-linux-gnu/* .
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
