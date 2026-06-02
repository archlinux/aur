# Maintainer: wackbyte <im@purring.fyi>

_pkgname=asphalt
pkgname=asphalt-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='Upload and reference Roblox assets in code'
arch=('aarch64' 'x86_64')
url='https://github.com/jackTabsCode/asphalt'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('libarchive')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/asphalt-aarch64-unknown-linux-gnu.tar.xz")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/asphalt-x86_64-unknown-linux-gnu.tar.xz")
b2sums_aarch64=('b4c0833ae2fa422cffcdd2695ed325a21cc58784df9080c83204ce94697ec2042e8619959bc4343a1a1cbfc790dd1ffe362a3bc019d274dea7e21e62cc281141')
b2sums_x86_64=('59ab0ba91e085f1f3701a94a71c70c5f14f55d5f391168432c3a8e42d8438e0a3984c63c77ba86809a3d2116fcdec16e6743b40535ed4185df5ee37a21062a9e')

prepare() {
    tar -xf "${_pkgname}-${pkgver}-${CARCH}.tar.xz"
    mv "asphalt-${CARCH}-unknown-linux-gnu"/* .
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
