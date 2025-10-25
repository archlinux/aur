# Maintainer: wackbyte <im@purring.fyi>

_pkgname=asphalt
pkgname=asphalt-bin
pkgver=1.2.0
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
b2sums_aarch64=('8556823f7cfab1d0037b8e2fee85835cfbd15e6913d6fb3c63fe21ccf867ffe9da8867e71096ea5dd590b11214acbe97366f3793f6937352e30486113919e323')
b2sums_x86_64=('9c1e245d06c75064e0ef9acbf2a0fa24d108dc967c2b2f18066ef052a6c17a870bb05f455aecd7b90a95090f6757052a44f20df847a47ecd31ed5b54616e8fff')

prepare() {
    tar -xf "${_pkgname}-${pkgver}-${CARCH}.tar.xz"
    mv "asphalt-${CARCH}-unknown-linux-gnu"/* .
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
