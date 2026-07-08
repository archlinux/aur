# Maintainer: wackbyte <im@purring.fyi>

_pkgname=asphalt
pkgname=asphalt-bin
pkgver=2.0.2
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
b2sums_aarch64=('aa1cf4f4b3e2ad955f9a37882f3060c6e6c2d62134f4a2d11db291efddbdb6e0540f3d876aa26464a78c860becc927b60104f1e708b92cb47a301a1cd894c320')
b2sums_x86_64=('63f1fe2e1404d516ee0dd9e1d733ab34611f5cd7aee1fdf56519c4772a3b3b9df27a1d0f64a7677db26090a9a93a6d2a34f06d5ae2364cd16d16b7eb2fdf0c9e')

prepare() {
    tar -xf "${_pkgname}-${pkgver}-${CARCH}.tar.xz"
    mv "asphalt-${CARCH}-unknown-linux-gnu"/* .
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
