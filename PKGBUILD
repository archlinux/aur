# Maintainer: wackbyte <im@purring.fyi>

_pkgname=asphalt
pkgname=asphalt-bin
pkgver=2.0.0
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
b2sums_aarch64=('606da9d904d37f3701fd892ea437c2392323b6e2fd957ccdba8944c4e502126c30475a973603a3f382a7c3c732b0b06419558be568f1429283e443e8caf80dc8')
b2sums_x86_64=('ec58f23644144627ddb3859faf91e836e9c60eaa8d0fb8d9b372cb8dd9b4ead7d7ec7af5ccf92f01a9e955e130b832dcb0aa7460e31eca0919f80cbf236f426d')

prepare() {
    tar -xf "${_pkgname}-${pkgver}-${CARCH}.tar.xz"
    mv "asphalt-${CARCH}-unknown-linux-gnu"/* .
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
